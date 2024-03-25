package field

import (
	"math/rand"
	"net/http"
	"strconv"
	"time"

	inter "synhelper/internal/field/interface"
	storage "synhelper/internal/field/storage"
	repo "synhelper/repository"

	"github.com/gin-gonic/gin"
)

func CreateField(c *gin.Context, data inter.FieldInput) {
	rank := ClassifyField(data.Area)
	value := MakePrice(rank)
	input := inter.Field{
		Name:  data.Name,
		Price: value,
		Loc:   data.Loc,
		Rank:  rank,
		Area:  data.Area,
	}
	res, err := storage.CreateField(repo.Db, input)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"messge": "Your field dont by create", "err": err})
	}
	c.JSON(http.StatusOK, gin.H{"message": "field created", "data": res})
}
func SearchField(c *gin.Context, data inter.SearchField) {
	res, err := storage.SearchField(repo.Db, data)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"messge": "Your field dont by create", "err": err})
	}
	c.JSON(http.StatusOK, gin.H{"message": "field created", "data": res})
}
func EditField(c *gin.Context, data inter.Field) {
	rank := ClassifyField(data.Area)
	value := MakePrice(rank)
	input := inter.Field{
		Name:  data.Name,
		Price: value,
		Loc:   data.Loc,
		Rank:  rank,
		Area:  data.Area,
	}
	err := storage.UpdateField(repo.Db, input)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"messge": "Your field dont by create", "err": err})
	}
	c.JSON(http.StatusOK, gin.H{"message": "field edited"})
}
func DeleteField(c *gin.Context, data inter.SearchField) {
	err := storage.DeleteField(repo.Db, data)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"messge": "Your field dont by create", "err": err})
	}
	c.JSON(http.StatusOK, gin.H{"message": "field deleted"})
}
func SearchAllField(c *gin.Context) {
	res, err := storage.SearchAllField(repo.Db)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"messge": "Your field dont by create", "err": err})
	}
	c.JSON(http.StatusOK, gin.H{"message": "field created", "data": res})
}

func MakePrice(rank string) string {
	seed := time.Now().UnixNano()
	r := rand.New(rand.NewSource(seed))

	var minPrice, maxPrice int

	switch rank {
	case "Rank A":
		minPrice = 20000
		maxPrice = 60000
	case "Rank B":
		minPrice = 15000
		maxPrice = 55000
	case "Rank C":
		minPrice = 10000
		maxPrice = 50000
	case "Rank D":
		minPrice = 5000
		maxPrice = 15000
	default:
		return "Rank not recognized"
	}
	randomNumber := r.Intn(maxPrice-minPrice+1) + minPrice

	return strconv.Itoa(randomNumber)
}

func ClassifyField(area uint64) string {
	for {
		switch {
		case area >= 10000:
			return "Rank A"
		case area >= 6000:
			return "Rank B"
		case area >= 2000:
			return "Rank C"
		case area >= 500:
			return "Rank D"
		default:
			return "Rank E"
		}
	}
}
