package main

import (
		"fmt"
)

var alice = Person{"Alice"}
var bob = Person{"Bob"}

const (
	Male = 0
	Femail = 1
)

type Person structs {
	Name string
	Sex int
}


func main(){

	// this is a comment

	// a := Person{"Alice"}
	// fmt.Printf("%+v\n", a)


	fmt.Printf("$v+\n", alice)


}

