pico-8 cartridge // http://www.pico-8.com
version 16
__lua__

palt (0, false)
palt (10, true)
player = {
  x = 8,
  y = 56,
  sprite = 1,
  speed = 2,
  jumped = false
 }

debug = {}
debug.y = 0

---animation stuff ----

--object, start frame,
--num frames, speed, flip
function anim(o,sf,nf,sp,fl)
 if(not o.a_ct) o.a_ct=0
 if(not o.a_st) o.a_st=0

 o.a_ct+=1

 if(o.a_ct%(30/sp)==0) then
  o.a_st+=2
  if(o.a_st >= nf) o.a_st=0
 end

 o.a_fr=sf+o.a_st
 spr(o.a_fr,o.x,o.y,2,2,fl)
end

function jump_anim(o,sf,nf,sp,fl)
 if(not o.a_ct) o.a_ct=0
 if(not o.a_st) o.a_st=0

 o.a_ct+=1

 if(o.a_ct%(30/sp)==0) then
  o.a_st+=2
  if(o.a_st >= nf) o.a_st=0
 end

 o.a_fr=sf+o.a_st
 spr(2,o.x,o.y,2,2,fl)
end

-------------------


---world shit ------

function gravity(fall_speed)

 return fall_speed
end

function hitwall(player)
 right_wall = player.x + 16
 left_wall = player.x

 if right_wall >= 1024 then
  return true
 elseif left_wall <= 0  then
  return false
 end

end

function onfloor(player)
position_left_x = (player.x+16)/8
position_right_x = (player.x)/8
position_y = (player.y + 16)/8

sprite_left = mget(position_left_x,position_y)
sprite_right = mget(position_right_x,position_y)
if((sprite_left == 64) or (sprite_left == 65) or (sprite_left == 66) or (sprite_left == 68) or (sprite_left == 69) or (sprite_left == 70)) then
 return true
elseif((sprite_right == 64) or (sprite_right == 65) or (sprite_right == 66) or (sprite_right == 68) or (sprite_right == 69)or (sprite_right == 70)) then
 return true
end

return false
end

function grounded()
    v = mget(flr(player.x+8)/8, flr(player.y+8)/8+1)
    return fget(v, 0)
end


-----------------------

--character functions--

function move()
 player.moving = true
 player.sprite += 2
 if player.sprite > 5 then
  player.sprite = 1
 end
end



-----------------------



-------game------------
function _init()
 cls()
 map(0,0,0,0,16,16)
    dy = 0
 dx = 0
 change_cam_x = 0
 music(0)

end

cam_x = 0
cam_y = 0

function _update()
  player.moving = false

  --x acceleration----
  d_dx = 0
  d_dy = 0
  d_cam_x = 0

  if btn(0) and cam_x > 0 then
    if(hitwall(player) == false) then
    d_dx = 0
    else
    d_dx = -.25
    d_cam_x = - .25
    end  end
  if btn(1) and cam_x < 1024 then 
    if(hitwall(player) == true) then
    d_dx = 0
    else
    d_dx = .25
    d_cam_x = .25
    end
  end

  if(hitwall(player) == false) then
   dx = 0
  elseif(hitwall(player) == true) then
   dx = 0
  end
  dx += d_dx
  change_cam_x += d_cam_x

  if change_cam_x > 3 then
      change_cam_x = 3
  elseif change_cam_x < -3 then
        change_cam_x = -3
  end
  if d_cam_x == 0 then
      change_cam_x *= 0.8
  end

  if dx > 3 then
      dx = 3
  elseif dx < -3 then
        dx = -3
  end

  if d_dx == 0 then
      dx *= 0.8
  end


-------y acceleration----------
  if grounded() and player.jumped == false then
    player.y =flr(flr(player.y)/8)*8
    dy = 0
    if btnp(2) then
    dy -= 2
    player.jumped = true
    sfx(5)
    end
  elseif player.jumped == true and dy > -6 then
    if(dy < 0 and dy >= -4) then
       dy -= 1
    elseif (dy < -4 and dy >= -5) then
       dy -= .75
    elseif (dy < -5 and dy >= -6.5) then
       dy -= .15
    end
  elseif dy <= -6 then
    player.jumped = false
    dy = 0
  else
    dy += gravity(.5)
  end





  if not player.moving then
   player.sprite = 1
  end

  player.y += flr(dy)
  player.x += dx
  cam_x += change_cam_x
end



function _draw()
  cls()
  camera((cam_x),cam_y)
  map(0, 0, 0, 0, 128, 32)
  ---map(0,0,0,0,16,16)
  if btn(0) then
    anim(player,1,5,10,true)
  elseif btn(1) then
    anim(player,1,5,10)
  else
    spr(player.sprite, player.x, player.y,2,2)
  end
  camera()
  print('('..cam_x..', '..cam_y..')', 0, 0, 7)
end



__gfx__
00000000aaaaaaa0aaaa0aaaaaaaaa090aa090aaaaaaaaa0aaaa0aaa000000000000000000000000000000000000000000000000000000000000000000000000
00000000aaaaaa090aa090aaaa0aaa0990a0490aaaaaaa090aa090aa000000000000000000000000000000000000000000000000000000000000000000000000
00000000aa00aa0990a0490aa090aaf49000090aa000aa0990a0490a000000000000000000000000000000000000011100000000000000000000000000000000
00000000409900f49000090aa0f90af49999900a049900f49000090a000110000000000000000000000000000001111100000000000000000000000000000011
00000000a0f990f4999990aaa0ff90999099000049ff90f499999000111100100000000000000000000000001001111100000000000000000000000011101111
00000000a0ff9099909900000fff904990990ff0a0fff09990990004111100100000000000001110000000111101111110000000000000000000000111101111
000000000fff904990990ff004f4f044ffffff0a04f4f04990990ff0111101110000000000111110000001111100000110000000000000000000111111101111
000000000ffff044ffffff00094f49044ffff0aa09494044ffffff0a111001110000000000111100000111111111110011000000000000000000111111001111
3333333304f4f9044ffff00a049999400000000a099999044ffff0aa110011110000000000111100001111111111111000100000000000000000111110011111
3333333309494440000000aa0449909928992990049999400000000a001011110000000010011100111111111111111111100000000000000000111100001100
333ee333049999092899290a044490f0262860f04449909928992990111011110000000011001000111111111111111111100000000000000000111100100001
332eee330449909026286090a044440220288000044490f0262860f0111011110000000111101001111111111111111111110000000000000000111001111111
32e22e33a04490f0222880f0aa04400220000090a04444022028800a111011110000000111100000111111111111111111110000000000000001110001111111
32e2e233aa0444022022800aaaa009000aaaaa0aaa0440022000090a111001110000000111110000111111111111111111110000000000000001110011111111
33232333aaa00002200200aaaaaaaaaaaaaaaaaaaaa000900aaaa0aa1110011100000001111111001111111110011ddddd1d0000000000000000000111111111
33333333aaaaaa090a090aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa111101110000000111111100d11111111001dddddd1d0000000000000000000111111111
33333333000000000000000000000000000000000000000000000000111101110000000111111d00ddd11111100ddddddd110000000000000000111111111111
33333333000000090000900000000000000000000000000900009000111101110000000dd111ddd00dd111111000dd00ddd10000000000000001111111111111
3333333300000009900049000000000900009000000000099000490011110ddd0000000ddd1dddd00dd111111000dd00dd1100000000000000d1111111111111
33333333409900f4900009000090000990004900000000f490000900111d1ddd00000001dd11ddd0ddd1111110000d00dd1d00000000000000ddd1111d111111
3333333300f990f49999900000f900f490000900000000f499999000111d1ddd000000011dd1ddddddd1111111000000dd1d00000000000000dd1dd11d111111
3333333300ff90999099000000ff90f4999990000499009990990000111d1dddd000000d1111ddddddd1111110000000dd1d000000000000001d1ddd11111111
333333330fff904990990ff00fff90999099000449ff904990990f00111d111dd000000dddd1ddddddd1111110000000dddd0000000000000011111dd1111111
333333330ffff044ffffff0004f4f04990990ff000fff044fffffff011d11d11d1000000dd11ddddddd1111110dd000000ddd000000000000dd1111111111111
3333333304f4ff044ffff000094f4044ffffff0004f4f4044ffff00011111dd1d1000000dd1dddddddd11111100d000000000000000000000dddd1dddd111111
3333b3330949444000000000049999044ffff00009494940000000001111ddd111d000000dddddddddd11111dd0dd00000000000000000000dddd1dddd111111
33333333049990992899290004499040000000000449909928992900111ddddd11d000000dddd1dddd111111dd0dd00000000000000000000dddd1dddd1dd111
33333b3304490900262860900444090028992090044409002628609011ddddd11dd000000dddd1dddd111111ddd0d00000000000000000000dddd1dddd11d111
3b33333300440f00222880f000440f00268860f000440f00222880f011dddddd1dd000000dd1d11ddd11111ddd0dd0d00000000000000000ddddd1ddddd1d111
3b33333300044002202280000004400222288000000440022022800011dddddd1dd000000dd11111dd11111ddd0d00d00000000000000000ddddddddddd1d111
33bb333300000002200200000000000220020000000000022002000011ddddddddd000000dddd1111111111ddd0000dd0d00000000000000ddddddddddd1d111
3333333300000009000900000000000900090000000000090009000011dddd0dddd000000ddddd111111111dddd0d0dd0dd0000000000000ddddddddddddd111
1bbbbbbbbbbbbbbbbbbbbbb1444444441bbbbbbbbbbbbbbbbbbbbbb111dddd00ddd000000ddddd111111111dddddd0d0ddd00000000000000dddd0ddddddd111
bbb33b333bb33b3333b33bbb44444444b3b33bb33bb33b333bb33b3b11dddd00ddd00000dddddd111111111dddddd0d0ddd00000000000000dddd000dddddd11
b3b1131113b1131111311b3b44444444b1311b3113b1131113b1131b1ddddd000dd00000dddddd111111111dddddd0d0ddd00000000000000dd0000ddddddd11
b3314144433141444414133b44444444b4141334433141444331414b1dddddd000000000dddddd111111111dddddd0d0ddd000000000000000d0000dddddd111
311444444114444444444113444444443444411441144444411444431dddddd000000000ddddddd11111111dddddd0d0dd0000000000000000d00dddddddd111
1444444444444444444444414444444414444444444444444444444111ddddddd0000000dddddddd1111111dddddd0dd0d0000000000000000000dddddddd111
4444444444444444444444444444444424444444444444444444444211dd1dddd0000000dddddddd1111111ddddddddd0d0000000000000000000dddddddd111
4444444444444444444444444444444412222222222222222222222111d11dddd0000000ddddddd11111111ddddddddddd0000000000000000000dddddddd111
0333b3333333333333333333333b333000000000000000000000000011111dddd0000000ddddddd111111111dddddddddd0000000000000000000dddddddd111
0b33b3b333333b333b33b3333b3b33b00000000000000000000000001111ddddd0000000ddddddd1111111111ddddddddd0000000000000000000dddddddd111
0bb33b3333b333333b3b0b3333b33bb00000000000000000000000001111dddddd000000ddddddd1111111111ddddddddd0000000000000000000dddd1ddd111
00bb3333333bb33333b0bb333333bb000000000000000000000000001111dddddd000000ddddddd1111111111ddddddd110000000000000000000dd111dd1111
0000bb3b3333333b3bb0bbb3b3bb0000000000000000000000000000111ddddddd0000000dddddd1111111111ddddd11110000000000000000000111111d1111
00000bbbbb3333bbbb0000bbbbb00000000000000000000000000000111dddddd00000000ddddd1111111111111d111111000000000000000000001111111111
0000000b0bbbbbb0b000000bb0000000000000000000000000000000111dddddd00000000ddddd11111111111111111111000000000000000000001111111111
000000000000000000000000000000000000000000000000000000001111dddd0000000000ddd111111111111111111110000000000000000000001111111111
000000900000000044444444000000000000000000000000000000001111dddd0000000000ddd111111111111111111110000000000000000000001111111111
0000001000000000444444440000000000000000000000000000000011111dd00000000000111111111111111111111110000000000000000000000011111111
0000e2e0000ee000444ee44400000000000000000000000000000000111111d00000000000111111111111111111111100000000000000000000000001111111
00ee8280002eee00442eee4400000000000000000000000000000000111111100000000000011111111111111111111100000000000000000000000001111111
ee88828002e22e0042e22e4400000000000000000000000000000000111111100000000000011111111111111111111100000000000000000000000000111111
8888828002e2e20042e2e24400000000000000000000000000000000111111100000000000001111111111111111111000000000000000000000000000111111
08888280002320004423244400000000000000000000000000000000111111000000000000000111111111111111110000000000000000000000000000111111
00008280000300004443444400000000000000000000000000000000111111000000000000000011111111111111100000000000000000000000000000111111
00000010000000000000000000000000000000000000000000000000111100000000000000000000000000001111000000000000000000000000000000111111
00000010000000000000000000000000000000000000000000000000111000000000000000000000000000000010000000000000000000000000000000111111
00000040000000000000000000000000000000000000000000000000111000000000000000000000000000000000000000000000000000000000000000111111
00000040000000000000000000000000000000000000000000000000111000000000000000000000000000000000000000000000000000000000000000010000
00000090000000000000000000000000000000000000000000000000110000000000000000000000000000000000000000000000000000000000000000000000
00000090000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000414000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00004444000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__gff__
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001010100010101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
2020202020102052202020302020202020102020202020202020202020202030202020202020202020302020202020202020202020102020202020202020202020203020202020202020202020202030202020202010202020202020202020203020202020202020201020202020202020202020203020202020202020202020
2030202020205300505120202020202020202020202030201020202052202020202010202020202020202020525151525151503020202020203020202020202020201020202051515251512020202020205151515251515151515251515151302020202020202020202020202010202020202020202020202020201020302020
2020525151531d1d1d1d5051515251515152515152202020205251530050515151525153505151525151525300000000000000505151515152515151515151525151515151531d000061005051515251530000000000000000000000000055505152515151513010525151515151515152515151515152515152202020202020
5153090a0b0c0d0e0f0708090a0b0c0d0e0f070809505152530e0f0708090a0b0c0d0e0f0708090a0b0c0d0e0f070809610b0c0d0e0f0708090a0b0c0d0e0f0708090a0b0c0d0e0f4445460a0b0c0d0e0f0708090a0b0c0d0e0f0708090a0b0c0d0e0f07080950530c0d0e0f0708090a0b0c0d0e0f0708090a0b505151525151
1718191a1b1c1d1e1f1718191a1b1c1d1e1f1718191a1b1c1d1e1f1718191a1b1c1d1e1f1718191a1b1c1d1e1f17184445461c1d1e1f1718191a1b1c4445461718191a1b1c1d1e1f1718191a1b1c1d1e1f1718191a1b1c1d1e1f1718191a1b1c1d1e1f1718191a1b1c1d1e1f1718191a1b1c1d1e1f1718191a1b1c1d1e1f1718
2728292a2b2c2d2e2f2728292a2b2c2d2e2f2728292a2b2c2d2e2f2728292a2b2c2d2e2f2728292a2b2c2d2e2f2728292a2b2c2d2e2f2728292a2b2c2d2e2f272844462b2c2d2e2f2728292a2b2c2d2e2f2728292a2b2c2d2e2f2728292a2b2c2d2e2f2728292a2b2c2d2e2f2728292a2b2c2d2e2f2728292a2b2c2d2e2f2728
3738393a3b3c3d3e3f3738393a3b3c3d3e3f3738393a3b3c444545454545463b3c3d3e3f3738393a3b3c3d3e3f3738393a3b3c613e3f374445463b3c3d3e3f3738393a3b3c3d44463738393a3b3c3d3e3f3738393a3b3c3d3e3f3738393a3b3c613e3f3738393a3b3c3d3e3f3738393a3b3c3d3e3f3738393a3b3c3d3e3f3738
4748494a4b4c4d4e4f4748494a4b4c4d4e4f4748494a4b4c4d4e4f4748494a4b4c4d4e4f4748494a4b4c4d4e4f4748494a4b4445464f4748494a4b4c4d4e4f4748494a4b4c4d4e4f4748494a4b4c4d4e4f4748494a4b4c614e4f47484445454545464f4748494a4b4c4d4e4f4748494a4b4c4d4e4f4748494a4b4c4d4e4f4748
5758595a5b5c5d5e5f5758595a5b5c5d5e5f5758595a5b5c5d5e5f5758595a5b5c5d5e5f574041425b5c5d5e5f5758595a5b5c5d5e5f5758595a5b5c5d5e5f5758595a5b5c5d5e5f5758595a5b5c5d5e5f575844454545465e5f5758595a5b5c5d5e5f5758595a5b5c5d5e5f5758595a5b5c5d5e5f5758595a5b5c5d5e5f5758
6768696a6b6c6d6e6f6768696a6b6c6d6e6f67404141426c6d6e6f6768696a6b6c6d6e6f674343436b6c6d6e6f4445466a6b6c6d6e6f6768696a6b6c6d6e6f6768696a6b6c6d6e6f6768696a6b6c616e6f6768696a6b6c6d6e444546696a6b6c6d6e6f674445466b6c6d6e6f676869404141426e6f6768696a6b6c6d6e6f6768
777855557b7c7d7e7f7778797a7b7c7d7e7f77434343437c7d7e7f7778797a7b7c7d7e7f774362437b7c617e7f7778797a7b7c7d7e7f7778797a7b7c7d7e7f7778797a7b7c7d7e7f7778797a44454545454678797a7b7c7d7e7f7778797a7b7c7d7e7f7778797a7b7c7d4041414141424343437e7f7778797a7b7c7d607f7778
0000555500000000000000000000000000000043436243000000000000000000006100004041414141414142000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000656500000000000000006343434343434343624363000000006100000070000000
4d4d4041414141414141414142544041414141414141414255555555555555554041414141414141414141414141414141414141414141414141414141414141414141414141414141426565656565656565656565656565656565656565656565656565545454545440414141414141414141415d5d5d414141414141425454
424d4343434343434343434343544343434343434343434355555555555555554343434343434343434343434343434343434343434343434343434343434343434343434343434343436565656565656565656565656544454665656565656565656565545454545443434343434343434343435d5d5d434343434343435454
434d4343434343434343434343544343434343434343434355555555555555554343434343434343434343434343434343434343434343434343434343434343434343434343434343436565656565656565656565656565656565656565656565656565545454545443434343434343434343435d5d5d434343434343435454
41424343434343434343434343544343434343434343434355555555555555554343434343434343434343434343434343434343434343434343434343434343434343434343434343436565656565656565656565656565656565656565656565656565545454545443434343434343434343435d5d5d434343434343435454
4362434343434343434343434041424343434343434343404141414141414141424343434343434343434343434343434343434343434343434343434343434343434343434343434343555555555555555555555555555555555555555555555555555555555555554343434343434343434343555555434343434343435555
4141414243434343434343436243434343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434343555555555555555555555555555555555555555555555555555555555555554343434343434343434343555555434343434343435555
4141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000555555550000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
011e0000181421a1421c1421d1421c1421d1421f14221142181421a1421c1421d1421c1421d1421f142211421c1421d1421f142211421f1422114223142241421c1421d1421f142211421f142211422314224142
011e00000c1750c1750c1750c1750c1750c1750c1750c1750c1750c1750c1750c1750c1750c1750c1750c17509175091750917509175091750917509175091750917509175091750917509175091750917509175
011e0000240551f055180551f055240551f055180551f055240551f055180551f055240551f055180551f055210551c055180551c055210551c055180551c055210551c055180551c055210551c0551a05518055
011e00000005200052000520005200052000520005200052000520005200052000520005200052000520005209052090520905209052090520905209052090520905209052090520905209052090520905209052
000200201d6101f6302264027640296502c6502f650336503564034640326402f6302b6302b6302762023620236202462026620296302c6302f64033650346503565033650326502c6502a640286302363023630
01020000185721a5721c5721d5721f572215722357218572005020050200502005020050200502005020050200502005020050200502005020050200502000020000000000000000000000000000000000000000
__music__
03 00010203
03 04424344
00 05424344

