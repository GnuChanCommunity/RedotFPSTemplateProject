extends Node


var PlayerSettings = {
	"Name":"Dumb",
	"lang":"turkish",
	"Speed":3,
	"CurrentSpeed":3,
	"MaxSpeed":5,
	"Stamina":3,
	"MouseSpeed":0.2,
	"JumpHeight":5,
	"HeadBob":true,
	"CanWalk":true,
	"CanRun":true,
	"CanJump":true,
	"Duck":false,
	"Crawling":false,
	"UsingPC":false,
	"HandReady":true,
	"HandCurrentIndex":0,
	"BeforeHandIndex":0,
	"HoldingQuestItem":false,
	"FOV":90,
	"FOVMAX":90,
	"FOVMIN":50,
	"GiveLife":false,
	"OpenConsole":false,
	"OpenSettings":false,
	"screenMode":false,
	"talkMode":false,
	"Swim": false
}

var EnergyReady0 = false
var EnergyReady1 = false
var EnergyReady2 = false

var FusionReady = false
var EngineReady = false
var PortalReady = false

var walkNow = false
var firstLoading = true

var settings0 = false
var settings1 = false
var settings2 = false
var settings3 = false
var settings4 = false
var settings5 = false
var settings6 = false

# Main Game
var day = 1
var day1_finish = false
var day2_finish = false
var day3_finish = false
var day4_finish = false
var day5_finish = false
var daysEnd = false


var FirstDoorKey  = false
var FirstDoor_ray  = false

var SecondDoorKey = false
var ThirdDoorKey  = false

var ThirdDoor0 = false
var ThirdDoor1 = false
var ThirdDoor2 = false
var ThirdDoor3 = false

var ScreetDoor    = false
var ScreetWall    = false
var ScreetEnd     = false
