package external

import (
	"bytes"
	"encoding/json"
	"fmt"
	"io"
	"net/http"
	"net/url"

	"github.com/gin-gonic/gin"
)

type API struct {
	BaseURL        string
	RecaptchaToken string
}

func NewAPI(baseURL string, recaptchaToken string) *API {
	return &API{BaseURL: baseURL, RecaptchaToken: recaptchaToken}
}

func (api *API) PostApiExternal(c *gin.Context, endpoint string, data interface{}) error {
	payload, err := json.Marshal(data)
	if err != nil {
		return fmt.Errorf("falha ao converter dados para JSON: %w", err)
	}

	// Adicionando token reCaptcha como parte da autorização
	req, err := http.NewRequest("POST", api.BaseURL+endpoint, bytes.NewBuffer(payload))
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"res": "fail for Post solicitation: %w", "err": err})
		return nil
	}
	req.Header.Set("Content-Type", "application/json")
	req.Header.Set("Authorization", fmt.Sprintf("Bearer %s", api.RecaptchaToken)) // Incluir token reCaptcha

	client := &http.Client{}
	resp, err := client.Do(req)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"res": "fail for Post solicitation: %w", "err": err})
		return nil
	}
	defer resp.Body.Close()

	body, err := io.ReadAll(resp.Body)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"res": "fail for Post solicitation: %w", "err": err})
		return nil
	}

	if resp.StatusCode != http.StatusOK {
		c.JSON(http.StatusInternalServerError, gin.H{"res": "fail for Post solicitation: %w", "err": string(body)})
		return nil
	}

	c.JSON(http.StatusOK, gin.H{"res": "Your req send for Syngenta: %w", "body": body})
	return nil
}

func (api *API) GetApiExternal(c *gin.Context, endpoint string) map[string]interface{} {
	req, err := http.NewRequest("GET", api.BaseURL+endpoint, nil)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"res": "fail for Post solicitation: %w", "err": err})
		return nil
	}

	client := &http.Client{}
	resp, err := client.Do(req)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"res": "fail for Post solicitation: %w", "err": err})
		return nil
	}
	defer resp.Body.Close()

	body, err := io.ReadAll(resp.Body)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"res": "fail for Post solicitation: %w", "err": err})
		return nil
	}

	if resp.StatusCode != http.StatusOK {
		c.JSON(http.StatusInternalServerError, gin.H{"res": "fail for Post solicitation: %w", "err": err})
		return nil
	}

	var data map[string]interface{}
	err = json.Unmarshal(body, &data)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"res": "fail for Post solicitation: %w", "err": err})
		return nil
	}

	c.JSON(http.StatusOK, gin.H{"res": "Successfully:", "body": data})
	return data
}

func (api *API) GetWitParams(c *gin.Context, endpoint string, params map[string]string) *http.Response {
	u, err := url.Parse(api.BaseURL + endpoint)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"res": "fail for Post solicitation: %w", "err": err})
		return nil
	}

	q := u.Query()
	for key, value := range params {
		q.Set(key, value)
	}
	u.RawQuery = q.Encode()

	resp, err := http.Get(u.String())
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"res": "fail for Post solicitation: %w", "err": err})
		return nil
	}

	c.JSON(http.StatusOK, gin.H{"res": "Successfully:", "body": resp})
	return resp
}
