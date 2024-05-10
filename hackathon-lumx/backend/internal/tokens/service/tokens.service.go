package service

import (
	"fanify/db"
	inter "fanify/internal/tokens/interface"
	"fanify/internal/tokens/storage"
	"fanify/package/lumx"
	lInterface "fanify/package/lumx/interface"
	"fmt"
	"math/rand"
	"net/http"
	"strconv"
	"time"

	"github.com/gin-gonic/gin"
)

func CreateToken(c *gin.Context, input inter.TokenCreateInput) {
	newInput := lInterface.TokenTypeRequest{
		Traits:      *input.Traits,
		MaxSupply:   input.MaxSupply,
		Name:        input.Name,
		Description: input.Description,
		ImageURL:    input.ImageURL,
	}
	res, err := lumx.CreateTokenType(input.ContractId, newInput)
	if err != nil {
		c.Set("Error", "Error in lumx Api")
		c.Status(http.StatusNotAcceptable)
		return
	}
	inputDB := inter.SaveToken{
		UriNumber:  uint64(res.UriNumber),
		ContractID: res.ContractID,
	}
	_, err = storage.CreateTokenDb(db.Repo, inputDB)
	if err != nil {
		c.Set("Error", err)
		c.Status(http.StatusInternalServerError)
		return
	}
	c.Set("Response", res)
	c.Status(http.StatusOK)
}

func MakeTransfer(c *gin.Context, input inter.Transaction) {
	newInput := lInterface.TransferDetails{
		ContractId: input.ContractID,
		From:       input.From,
		To:         input.To,
		Quantity:   input.Quantity,
	}
	res, err := lumx.CreateTransfer(newInput)
	if err != nil {
		c.Set("Error", "Error in lumx Api")
		c.Status(http.StatusNotAcceptable)
		return
	}
	response := fmt.Sprintf("Transfer is by made. It may take a few minutes if you have a lot of orders, but it will be delivered on time :)\nNumber order: %s", res.TransactionHash)
	c.Set("Response", response)
	c.Status(http.StatusOK)
}

func MakeTrade(c *gin.Context, input inter.Trade) {
	newInput := lInterface.TransferDetails{
		ContractId: input.Transaction1.ContractID,
		From:       input.Transaction1.From,
		To:         input.Transaction1.To,
		Quantity:   input.Transaction1.Quantity,
	}
	r1, err := lumx.CreateTransfer(newInput)
	if err != nil {
		c.Set("Error", "Error in lumx Api")
		c.Status(http.StatusNotAcceptable)
		return
	}
	newInput = lInterface.TransferDetails{
		ContractId: input.Transaction2.ContractID,
		From:       input.Transaction2.From,
		To:         input.Transaction2.To,
		Quantity:   input.Transaction2.Quantity,
	}
	r2, err := lumx.CreateTransfer(newInput)
	if err != nil {
		c.Set("Error", "Error in lumx Api")
		c.Status(http.StatusNotAcceptable)
		return
	}
	response := fmt.Sprintf("Transfer is by made. It may take a few minutes if you have a lot of orders, but it will be delivered on time :)\nNumber orders: %s\n %s", r1.TransactionHash, r2.TransactionHash)
	c.Set("Response", response)
	c.Status(http.StatusOK)
}

func GainTokens(c *gin.Context, input inter.Gimmetoken) {
	randomNumber := rand.Intn(1000000) + 1
	newInput := lInterface.MintRequest{
		ContractID: input.ContractID,
		WalletID:   input.WalletID,
		Quantity:   randomNumber,
		URINumber:  input.URINumber,
	}

	res, err := lumx.MintTransaction(newInput)
	if err != nil {
		c.Set("Error", "Error in lumx Api")
		c.Status(http.StatusNotAcceptable)
		return
	}
	c.Set("Response", res)
	c.Status(http.StatusOK)
}

func GetToken(c *gin.Context, UriToken string, ContractId string) {
	num, err := strconv.Atoi(UriToken)
	if err != nil {
		c.Set("Error", err)
		c.Status(http.StatusInternalServerError)
		return
	}
	res, err := lumx.FetchTokenType(ContractId, num)
	if err != nil {
		c.Set("Error", "Error in lumx Api")
		c.Status(http.StatusNotAcceptable)
		return
	}
	c.Set("Response", res)
	c.Status(http.StatusOK)
}

func GetAllToken(c *gin.Context, ContractId string) {
	res, err := lumx.FetchTokenTypes(ContractId)
	if err != nil {
		c.Set("Error", "Error in lumx Api")
		c.Status(http.StatusNotAcceptable)
		return
	}
	c.Set("Response", res)
	c.Status(http.StatusOK)
}

func ConvertToken(c *gin.Context, Token string) {
	currentNow := 10
	num, err := strconv.Atoi(Token)
	if err != nil {
		c.Set("Error", err)
		c.Status(http.StatusInternalServerError)
		return
	}
	converter := num

	res := inter.PriceInfo{
		Price:        strconv.Itoa(currentNow),
		PriceConvert: strconv.Itoa(converter),
		Token:        Token,
		TokenConvert: strconv.Itoa(converter),
		Date:         time.Now().UTC(),
	}
	c.Set("Response", res)
	c.Status(http.StatusOK)
}
