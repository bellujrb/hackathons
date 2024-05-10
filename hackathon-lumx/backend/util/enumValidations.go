package util

type QuestionsValidation struct {
	ValidForms      bool `json:"validForms"`
	ValidCategories bool `json:"validCategories"`
	ValidAge        bool `json:"validAge"`
}

func EnumQuestions(formsName string, categories string, age string) string {
	validForms := handleEnumFormsName(formsName)
	validCategories := handleEnumCategories(categories)
	validAge := handleEnumAges(age)

	validations := QuestionsValidation{
		ValidForms:      validForms,
		ValidCategories: validCategories,
		ValidAge:        validAge,
	}
	switch {
	case !validations.ValidForms:
		return "Forms not exist in enum"
	case !validations.ValidCategories:
		return "Categorie dont exist in enum"
	case !validations.ValidAge:
		return "Age Range dont exist in enum"
	default:
		return ""
	}

}

func handleEnumFormsName(formsName string) bool {
	switch formsName {
	case "Portage":
		return true
	default:
		return false
	}
}

func handleEnumCategories(categories string) bool {
	switch categories {
	case "Portage - Desenvolvimento Motor":
		return true
	case "Portage - Auto cuidados":
		return true
	case "Portage - Socializacao":
		return true
	case "Portage - Linguagem":
		return true
	case "Portage - Cognicao":
		return true
	default:
		return false
	}
}

func handleEnumAges(ages string) bool {
	switch ages {
	case "0 - 1":
		return true
	case "1 - 2":
		return true
	case "2 - 3":
		return true
	case "3 - 4":
		return true
	case "4 - 5":
		return true
	case "5 - 6":
		return true
	default:
		return false
	}
}
