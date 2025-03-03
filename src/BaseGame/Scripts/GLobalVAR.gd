extends Node


var PlayerSettings = {
	"Name":"Dumb",
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
	"HandReady":false,
	"HandCurrentIndex":0,
	"BeforeHandIndex":0,
	"HoldingQuestItem":false,
	"FOV":90,
	"GiveLife":false,
	"OpenConsole":false,
	"OpenSettings":false,
}

var EnergyReady0 = false
var EnergyReady1 = false
var EnergyReady2 = false

var FusionReady = false
var EngineReady = false
var PortalReady = false

var walkNow = false
