extends Node

var PlayerUsingPC = false
var PlayerMouseSpeed = 0.5
var PlayerCanMove = true
var PlayerCanRun  = true
var PlayerDuck    = false
var PlayerCrawling = false
var PlayerSpeed  = 3
var PlayerCurrentSpeed = 3
var PlayerMaxSpeed = 5
var PlayerStaminaTime = 3
var PlayerCameraFov = 90
var PlayerHeadShake = true
var playerQuestItem = false
var PlayerHandIndex = 0
var PlayerHandBeforeIndex = 0
var PlayerHandReady = false

var GiveLife = false
var LifeCount = 1
var LifeIndex = 0


var CardisPowerSource = false
# extra is soun volume
var fusion0 = false
var fusion1 = false
var fusion2 = false
# first start fusion x3
var fusionReady = false
# first fusion must ready this is game start
var EngineReady = false

var settingsx7Area = false
