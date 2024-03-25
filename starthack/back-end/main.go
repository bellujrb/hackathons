package main

import (
	"synhelper/config"
	repo "synhelper/repository"
)

func main() {
	r := config.SetupRouter()
	repo.ConnectDatabase()
	r.Run(":8080")
}
