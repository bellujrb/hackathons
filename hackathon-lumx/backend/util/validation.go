package util

import "regexp"

type InputValidator struct {
	Password string ` json:"passowrd"`
	Email    string ` json:"email"`
}

type OutputValidator struct {
	IsValidPassowrd bool `json:"isValidpassowrd"`
	IsValidEmail    bool ` json:"isValidemail"`
}

func IsValidEmail(email string) bool {
	emailRegex := regexp.MustCompile(`^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$`)
	return emailRegex.MatchString(email)
}

func UltimateValidator(email string, password string) string {

	validEmail := IsValidEmail(email)
	validPassword := validPassword(password)

	validation := OutputValidator{
		IsValidPassowrd: validPassword,
		IsValidEmail:    validEmail,
	}
	switch {
	case !validation.IsValidPassowrd:
		return "Password needs 8 Digits, one letter and special character"
	case !validation.IsValidEmail:
		return "Email is not valid"
	default:
		return ""
	}
}

func validPassword(password string) bool {
	if len(password) < 8 {
		return false
	}

	letterRegex := regexp.MustCompile(`[a-zA-Z]`)
	if !letterRegex.MatchString(password) {
		return false
	}

	specialCharRegex := regexp.MustCompile(`[^a-zA-Z0-9]`)
	if !specialCharRegex.MatchString(password) {
		return false
	}

	return true
}
