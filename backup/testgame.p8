pico-8 cartridge // http://www.pico-8.com
version 16
__lua__

palt(10, true)
mage = {}
mage.x = 32
mage.y = 16
mage.sprite = 1


bard = {}
bard.x = 48
bard.y = 16
bard.sprite = 2


paly = {}
paly.x = 64
paly.y = 16
paly.sprite = 3


priest = {}
priest.x = 80
priest.y = 16
priest.sprite = 4


manager = {}
manager.x = mage.x
manager.y = mage.y
manager.sprite = 64
manager.speed = 8


characters = {}
characters[1] = mage
characters[2] = bard
characters[3] = paly
characters[4] = priest

selection = false
debug = {}
debug.x = 0
characterselected = {}

function _init()
 cls()
 spr(manager.sprite, manager.x, manager.y)
 setstage()
end


function setstage()
 map(16, 0, 0, 0, 16, 16)
 spr(mage.sprite, mage.x, mage.y)
 spr(bard.sprite, bard.x, bard.y)
 spr(paly.sprite, paly.x, paly.y)
 spr(priest.sprite, priest.x, priest.y)
end

//function cursormove()
// if (manager.x > priest.x) then
//  manager.x = mage.x
// end
// if (manager.x < mage.x) then
//  manager.x = priest.x
//
// end
//
//end

function oncharacter(o)

 if (manager.x == o.x and manager.y == o.y) then
  characterselected = o
  selection = true
 end
end
function move(o)
debug = characterselected
 if(o.sprite == characterselected.sprite) then
  o.x = manager.x
  o.y = manager.y
 end
end
function movecharacter()
selection = false
foreach(characters,move)
end

function _update()
//
//   if not selection then
//   if btnp(0) then
//     manager.x -= manager.speed
//     cursormove()
//   end
//   if btnp(1) then 
//     manager.x += manager.speed
//     cursormove()
//   end
//  end




   if btnp(0) then
     manager.x -= manager.speed
   end
   if btnp(1) then 
     manager.x += manager.speed

   end
   if btnp(2) then 
     manager.y -= manager.speed

   end
   if btnp(3) then 
     manager.y += manager.speed
   end

   if(selection) then
    if(btnp(4)) then
     movecharacter()
     //characterselected = {}
    end
   else
    if(btnp(4)) then
      foreach(characters,oncharacter)
    end
   end

end
function _draw()
  cls()
  spr(manager.sprite, manager.x, manager.y)
  setstage()
end
__gfx__
aaaaaaaaaaa000aaaaa000aaaaa000aaaaa000aaf00000000000000faa0000aa0000000000000000000000000000000000000000000000000000000000000000
aaaaaaaaa009990aaa08880aa006660aaa01110a0555000000055500a0667c0a0000000000000000000000000000000000000000000000000000000000000000
aaaaaaaa08099f90a0888f8004466f60aa0441600550111111100550aa060c0a0000000000000000000000000000000000000000000000000000000000000000
aaaaaaaa080fff90a088ff80046fff60008444600501000001111050a0666caa0000000000000000000000000000000000000000000000000000000000000000
aaaaaaaa0800e290043f1f300f6616600999886005004422201111000825510a0000000000000000000000000000000000000000000000000000000000000000
aaaaaaaa0f2ee20a0f44330a04866680098928400504444442011100082665000000000000000000000000000000000000000000000000000000000000000000
aaaaaaaa082e2220a041f3300408680a0999220a0500444002011100082505000000000000000000000000000000000000000000000000000000000000000000
aaaaaaaa000000000000000000000000000000000500040042011000000000000000000000000000000000000000000000000000000000000000000000000000
88aaaa88a0a000aaaaa000aaaaa000aaaaa0000a0500222042010200aa0000aa0000000000000000000000000000000000000000000000000000000000000000
8aaaaaa80809990aaa08880a0446660aaa0111600022244444200200a066770a0000000000000000000000000000000000000000000000000000000000000000
aaaaaaaa08099f90a0888f8004666f60aa0441600000444444222200aa060c0a0000000000000000000000000000000000000000000000000000000000000000
aaaaaaaa080fff90a088ff800f6fff60099944604990044222222050a0666caa0000000000000000000000000000000000000000000000000000000000000000
aaaaaaaa0f20e290043f1f300466166009898840499900200222005008255c0a0000000000000000000000000000000000000000000000000000000000000000
aaaaaaaa082ee20a0f443330048666800999280a0009902222228050082661000000000000000000000000000000000000000000000000000000000000000000
8aaaaaa8a00e2220a041f30aa008680aa002220a2809900088888800082505000000000000000000000000000000000000000000000000000000000000000000
88aaaa8800000000000000000000000000000000f20440000000000f000000000000000000000000000000000000000000000000000000000000000000000000
aaaaaaaaf00000000000000ff00000000000000ff00600000000000f000000000000000000000000000000000000000000000000000000000000000000000000
a88aa88a0555099990099a0005550000005555000506666660505500000000000000000000000000000000000000000000000000000000000000000000000000
a8aaaa8a0550999990c099a005ccc888880555500550655566060550000000000000000000000000000000000000000000000000000000000000000000000000
aaaaaaaa050999aa990c099405c8c8888880cc500506555666666600000000000000000000000000000000000000000000000000000000000000000000000000
aaaaaaaa05099aa90990c0940cc8c8880888c0500506666606560550000000000000000000000000000000000000000000000000000000000000000000000000
a8aaaa8a00999000409900940088c000408cc0500066600040556050000000000000000000000000000000000000000000000000000000000000000000000000
a88aa88a09900fff40a99094088ccf44408cc4000660044440650000000000000000000000000000000000000000000000000000000000000000000000000000
aaaaaaaa000fffff40a00094000fffff4080440006004f0040604000000000000000000000000000000000000000000000000000000000000000000000000000
22aaaa2200f0ff0f4094409400ffffff40844050004cffcf40644050000000000000000000000000000000000000000000000000000000000000000000000000
2aaaaaa20040440ff40440940000f000f404400000fffffff4044000000000000000000000000000000000000000000000000000000000000000000000000000
aaaaaaaa00ffffffff440094004444ffff4408000040000ff0600600000000000000000000000000000000000000000000000000000000000000000000000000
aaaaaaaa00fffff0ff40099400ffff00ff4008000006666006600600000000000000000000000000000000000000000000000000000000000000000000000000
aaaaaaaa00fff00ff402099400fff000f40300500066006666080050000000000000000000000000000000000000000000000000000000000000000000000000
aaaaaaaa020fffff00222090030fffff003330500050550660888050000000000000000000000000000000000000000000000000000000000000000000000000
2aaaaaa200e00000e022220003300000333333000806666660888800000000000000000000000000000000000000000000000000000000000000000000000000
22aaaa22f00000000000000ff00000000000000ff00000000000000f000000000000000000000000000000000000000000000000000000000000000000000000
bbbbbbbb3333333b333333333b3333bb000000000000000000000000bbb3bbb4bbbbb3bb3bb4444b33bbbbbbbb3b444222222444444bbbb30000000000000000
bbbbbbbb444444434444444444444433000000000000000000000000bb44424444444444444444442444444bb44444b444444444444444440000000000000000
bbbbbbbb44ffff44fffffffff4fff444000000000000000000000000b4cc44cccccccccccccccccccccccc434ccc2999424299944992cc1c0000000000000000
bbbbbbbb4ffffff4fffffffffffffff4000000000000000000000000b4cccccccccccc1ccccccccccccccc2bcc1cc22222222222222ccccc0000000000000000
bbbbbbbb4ffffffffffffffffffffff400000000000000000000000034ccc1c1cc1cc111cccccc11cc2ccc44cccc2444424444444422cccc0000000000000000
bbbbbbbb4ffffffffffffffffffffff4000000000000000000000000bb4ccc11cc1112111cc12111c11ccc441cc1224444444444444411c10000000000000000
bbbbbbbb4ffffffffffffffffffffff4000000000000000000000000b4ccc11cc111111111c11c111111cc4b1111294499949949949211110000000000000000
bbbbbbbb4ffffffffffffffffffffff4000000000000000000000000b2cc121111111111111111111111cc4b1c11122222222222222111210000000000000000
bbbbbbbb4ffffffffffffffffffffff4000000000000000000000000b4cc111111111111111111111c11cc4b11112424244444444442cc110000000000000000
bbbbbbbb4ffffffffffffffffffffff4000000000000000000000000b4cc112c1111111111c1111111111c4b1111444444444444444411110000000000000000
bbbbb3bb4ffffffffffffffffffffff400000000000000000000000034cc1c1111ccc111111111112111cc431cc1294994949929949211c10000000000000000
bbbbb3bb4ffffffffffffffffffffff4000000000000000000000000344cccc11111111111111111111ccc4bccccc22222224222222ccccc0000000000000000
b3bbbbbb4ffffffffffffffffffffff4000000000000000000000000b42ccc1111111111111111111111cc4bcc1c2444442444444442c1cc0000000000000000
bbbbbbbb4ffffffffffffffffffffff4000000000000000000000000b4ccc11111111c11c11111111111cc4bcccc2499444444429944cccc0000000000000000
bbbbbbbb4ffffffffffffffffffffff4000000000000000000000000b4cccc11111111111111cc2111111c432424244244422992224224b40000000000000000
bbbbbbbb4ffffffffffffffffffffff4000000000000000000000000bb4c1c1111111111111111111111cc4bbbbbbbb44444422244bbbbbb0000000000000000
bbbbbbbb4ffffffffffffffffffffff4aa000aaaaaaa000000000aaab4cc11111c111111111111c11c11cc4bbbbbb444f44442444444bbbb0000000000000000
b3bbb3bb44fffffffffffffffffffff4a03bb00aa0003bbbbb33000ab4cc111c11111c111111111111111c4bbb3b44444444444443fbbbbb0000000000000000
bbbb33bb444ffffffffffffffffffff403bbb330a03bbbbbb3b33b00b44c1c11111111111c1111112111cc43bbb4444444444444444bb3bb0000000000000000
bb3bbbbb4ffffffffffffffffffffff40b1bb3b000bb1bbbbb333330b44cccc111111111cc1111c1111ccc4bbbbbbb4444444444444bbbbb0000000000000000
bbbbbb3b4ffffffffffffffffffff4f403b13b300bbb11bbb3331330bb42cccccccc21ccc111ccccc1ccc44bbbbb444444444f4444444bbb0000000000000000
bbbbbbbb4fffff4fffffffffffffff440b3bb3100b3111bb3b3331b0bb3321cccccccccccccccccccc44444bbbbb44b4444444ff444bbbbb0000000000000000
bbbbb3bb44fff4fffffffffff4ffff44a0b3310a031bbbbbb3b33b10bbbb34444444444444cccc4444bb4433b3b444444444444444444bbb0000000000000000
bbbbbbbb444444444444444444444444aa0000aa033b3b3b3b3333b0bbbbbbb3bbbbb3bbbb4422bb3bbbbbbb3bbb4f44f4444444444b4bbb0000000000000000
bbbbbbbb3333b333ffffffffffffffffaa0000aa0313b3b3b3133310111ccc2bbb4ccc11c11111111111c111bbbb4444444444444444bbbb0000000000000000
bbbbbb3b44443444ffffffffffffffffa066550a033133333311313011cccc4b34cc1cc11111211111111111bbbbbb4444444444b444b33b0000000000000000
bbbb4b3bfff444ffffffffffffffffffa0666650a00131333111100a11cc1cc4c2cccc1111111c1111111111bbbbb444444444444444bbbb0000000000000000
bb444343ffff44ffffffffffffffffffa0611550aa041111144130aa111ccccccccc1211111111ccccc111c1bbb4b444444444444444bbbb0000000000000000
bbb444bbffffffffffffffffffffffff05115510aa01444441140aaa111c1cccccc1111111c1c1ccccc11cc1bbbbb444f4444444444bbbbb0000000000000000
bb34bbbbfffffffffffffff4fffffff405555510aaa01444411440aa111111cccc11c11c1111ccc4cccccc11bbbb44f44444f44444444b3b0000000000000000
b33bbbbbfffffffffff44ff4fff44ff400155100aa0111144144440a11c111111111111111cccc4344ccc111b33bb4fb4444444444b44bbb0000000000000000
bbbbbbbbffffffff4444444444444444a000000aa000000000000000111111111111111111ccc42bb42cc111bbbbb444444444444f444bbb0000000000000000
bbb000bbbbb000bbbbb000bbbbb000bb88b000880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
b009990bbb08880bb006660bbb01110b8b0111080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
08099f90b0888f8004466f60bb044160bb0441600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
080fff90b088ff80046fff6000844460008444600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0800e290043f1f300f66166009998860099988600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0f2ee20b0f44330b0486668009892840098928400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
082e2220b041f3300408680b0999220b899922080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000880000880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
bb0000bbbbbb000000000bbbbb000bbb000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
b0667c0bb0003bbbbb33000bb03bb00b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
bb060c0bb03bbbbbb3b33b0003bbb330000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
b0666cbb00bb1bbbbb3333300b1bb3b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0825510b0bbb11bbb333133003b13b30000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
082665000b3111bb3b3331b00b3bb310000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
08250500031bbbbbb3b33b10b0b3310b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000033b3b3b3b3333b0bb0000bb000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
88bbbb880313b3b3b3133310bb0000bb000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
8bbbbbb80331333333113130b066550b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
bbbbbbbbb00131333111100bb0666650000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
bbbbbbbbbb041111144130bbb0611550000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
bbbbbbbbbb01444441140bbb05115510000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
bbbbbbbbbbb01444411440bb05555510000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
8bbbbbb8bb0111144144440b00155100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
88bbbb88b000000000000000b000000b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
