package db

import (
	"log"
	"os"

	"github.com/joho/godotenv"
	"gorm.io/driver/mysql"
	"gorm.io/gorm"
	"gorm.io/gorm/logger"
	"gorm.io/gorm/schema"
)

var Repo *gorm.DB

func ConnectDatabase() {
	err := godotenv.Load()
	if err != nil {
		log.Fatal("Erro ao carregar o arquivo .env")
	}

	databaseURL := os.Getenv("DB")
	if databaseURL == "" {
		log.Fatal("Variável de ambiente DB não configurada")
	}

	db, err := gorm.Open(mysql.Open(databaseURL), &gorm.Config{
		NamingStrategy: schema.NamingStrategy{
			SingularTable: true,
		},
		Logger: logger.Default.LogMode(logger.Info),
	})

	if err != nil {
		log.Fatal("Falha ao conectar ao banco de dados: ", err)
	}

	Migrate(db)

	Repo = db
}

func Migrate(db *gorm.DB) {
	db.AutoMigrate(&User{})
	db.AutoMigrate(&Login{})
	db.AutoMigrate(&Miner{})
	db.AutoMigrate(&Company{})
	db.AutoMigrate(&MktItems{})
}
