package main

import (
		"fmt"
)

var alice = Person{"Alice"}
var bob = Person{"Bob"}

type SexT int // what is this? 


const (
	// iota  like enums  
	// i don't have an iota 

	Unspecified SexT = iota
	Male
	Female

)

type Person structs {
	Name string
	Sex SexT	
}

func (p Person) Greet(other Person){
fmt.Person("Hey, %s\n",other.Name)
}

func main(){

	// this is a comment
	// a := Person{"Alice"}
	// fmt.Printf("%+v\n", a)
	fmt.Printf("$v+\n", alice)
}

