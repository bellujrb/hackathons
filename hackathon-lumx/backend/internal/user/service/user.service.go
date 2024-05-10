package service

import (
	"fanify/db"
	inter "fanify/internal/user/interface"
	"fanify/internal/user/storage"
	lumx "fanify/package/lumx"
	"fanify/util"
	"net/http"

	"github.com/gin-gonic/gin"
)

func PullContract(c *gin.Context, ContractId string) {
	if ContractId == "" {
		c.Set("Response", "Insert a ContractId")
		c.Status(http.StatusNotAcceptable)
	}
	res, err := lumx.FetchContractDetails(ContractId)
	if err != nil {
		c.Set("Error", "Error in lumx Api")
		c.Status(http.StatusNotAcceptable)
		return
	}
	c.Set("Response", res)
	c.Status(http.StatusOK)
}

func PullAllContract(c *gin.Context) {
	res, err := lumx.FetchContracts()
	if err != nil {
		c.Set("Error", "Error in lumx Api")
		c.Status(http.StatusNotAcceptable)
		return
	}
	c.Set("Response", res)
	c.Status(http.StatusOK)
}

func PullUser(c *gin.Context, email string) {
	validEmail := util.IsValidEmail(email)
	if !validEmail {
		c.Set("Error", "E-mail is invalid")
		c.Status(http.StatusBadRequest)
		return
	}
	res, err := storage.ConsultUser(db.Repo, email)
	if err != nil {
		c.Set("Error", err)
		c.Status(http.StatusInternalServerError)
		return
	}
	c.Set("Response", res)
	c.Status(http.StatusOK)
}

func CreateUser(c *gin.Context, user inter.UserController) {
	valid := util.UltimateValidator(user.Email, user.Password)
	if valid == "" {
		wallet, err := lumx.PostLumxWallet()
		if err != nil {
			c.Set("Error", "Error in lumx Api")
			c.Status(http.StatusNotAcceptable)
			return
		}
		login, err := storage.CreateLogin(db.Repo, user.Email, true)
		if err != nil {
			c.Set("Error", err)
			c.Status(http.StatusInternalServerError)
			return
		}
		encryptedPassword, err := util.Encrypt(user.Password)
		if err != nil {
			c.Set("Response", "Error encrypting Password")
			c.Status(http.StatusInternalServerError)

		}
		newUser := inter.UserControllerInputDb{
			Email:     user.Email,
			Password:  encryptedPassword,
			Wallet:    wallet.Address,
			WalletId:  wallet.ID,
			ProjectId: wallet.ProjectID,
			LoginId:   login.ID,
		}
		res, err := storage.CreateUser(db.Repo, newUser)
		if err != nil {
			c.Set("Error", err)
			c.Status(http.StatusInternalServerError)
			return
		}
		c.Set("Response", res)
		c.Status(http.StatusOK)
	} else {
		c.Set("Error", valid)
		c.Status(http.StatusNotAcceptable)
		return
	}
}

func CreateContract(c *gin.Context, input inter.ContractController) {
	if len(input.Symbol) >= 3 {
		res, err := lumx.CreateContractLumx(input)
		if err != nil {
			c.Set("Error", err)
			c.Status(http.StatusNotAcceptable)
			return
		}
		c.Set("Response", res)
		c.Status(http.StatusOK)
		return
	}
	c.Set("Error", "Symbols need 3 to 5")
	c.Status(http.StatusNotAcceptable)
}

func DeployContract(c *gin.Context, input inter.DeployController) {
	res, err := lumx.DeployContract(input.ContractId)
	if err != nil {
		c.Set("Error", err)
		c.Status(http.StatusNotAcceptable)
		return
	}
	c.Set("Response", res)
	c.Status(http.StatusOK)
}

func UserLogins(c *gin.Context, email string, status bool) {
	validEmail := util.IsValidEmail(email)
	if validEmail {
		c.Set("Error", "E-mail is invalid")
		c.Status(http.StatusBadRequest)
		return
	}
	_, err := storage.CreateLogin(db.Repo, email, status)
	if err != nil {
		c.Set("Error", err)
		c.Status(http.StatusInternalServerError)
		return
	}
	if status {
		return
	}
	c.Set("Response", "User loggout")
	c.Status(http.StatusOK)
}
