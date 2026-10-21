#!/bin/bash
#Лабораторная работа 1, вариант 14

git init
# mkdir lab0
# cd lab0/
# mkdir victor
# mkdir archive
# mkdir claude_monet
# cd victor/
# mkdir kitchen
# mkdir pastry
# mkdir hall
# mkdir reception
# mkdir management
# cd ..
# cd old_menu

echo "Баринов проверяет кухню ресторана Victor" > ~lab0/victor/kitchen/barinov_plan
echo "Лёва распределяет поваров по рабочим местам" >> ~/victor/kitchen/barinov_plan
echo "Новое меню готовят к вечернему открытию" >> ~/victor/kitchen/barinov_plan

echo "Макс предлагает утку с новым соусом" > ~/victor/kitchen/max_dish
echo "Баринов разрешает приготовить пробную порцию" >> ~/victor/kitchen/max_dish
echo "Блюдо подадут первым гостям ресторана Victor" >> ~/victor/kitchen/max_dish

echo "Катя готовит шоколадный десерт" > ~/victor/pastry/katya_dessert
echo "Украшение собирают перед самой подачей" >> ~/victor/pastry/katya_dessert
echo "Элеонора ждёт результат дегустации" >> ~/victor/pastry/katya_dessert

echo "Первый стол оставлен для Элеоноры" > ~/victor/hall/opening_tables
echo "Второй стол подготовлен для Нагиева" >> ~/victor/hall/opening_tables
echo "Большой стол займёт команда ресторана" >> ~/victor/hall/opening_tables

echo "Элеонора Андреевна прибывает к открытию" > ~/victor/hall/guest_list
echo "Дмитрий Нагиев приглашён на ужин" >> ~/victor/hall/guest_list
echo "Денис выступает для гостей вечером" >> ~/victor/hall/guest_list

echo "Столик четыре забронирован на семь часов" > ~/victor/reception/reservations
echo "Столик шесть нужен постоянным гостям" >> ~/victor/reception/reservations
echo "Вика подтверждает каждую бронь" >> ~/victor/reception/reservations

echo "Элеонора требует закончить подготовку вовремя" > ~/victor/management/eleonora_order
echo "Зал должен быть готов до приезда гостей" >> ~/victor/management/eleonora_order
echo "Баринов лично представляет праздничное меню" >> ~/victor/management/eleonora_order

echo "Утром проверить работу кухни" > ~/victor/management/vika_schedule
echo "Днём провести собрание официантов" >> ~/victor/management/vika_schedule
echo "Вечером встретить первых гостей" >> ~/victor/management/vika_schedule

echo "Луковый суп из Claude Monet" > ~/archive/old_menu
echo "Мильфей от Луи" >> ~/archive/old_menu
echo "Фирменное мясо от Баринова" >> ~/archive/old_menu

echo "Команда прощается с рестораном Claude Monet" > ~/claude_monet/farewell_note
echo "Старые рецепты сохраняются в архиве" >> ~/claude_monet/farewell_note
echo "Макс обещает не забывать первую кухню" >> ~/claude_monet/farewell_note

echo "Ресторан Victor открывается вечером" > ~/opening_day
echo "Баринов волнуется за новую команду" >> ~/opening_day
echo "Вика проверяет последние приготовления" >> ~/opening_day

chmod 755 ~/victor
chmod u=rwx,g=rx,o= ~/victor/kitchen
chmod 640 ~/victor/kitchen/barinov_plan
chmod u=rw,g=r,o= ~/victor/kitchen/max_dish
chmod 750 ~/victor/pastry
chmod u=rw,g=r,o= ~/victor/pastry/katya_dessert
chmod u=rwx,g=rx,o= ~/victor/hall
chmod 644 ~/victor/hall/opening_tables
chmod u=rw,g=r,o=r ~/victor/hall/guest_list
chmod 750 ~/victor/reception
chmod 640 ~/victor/reception/reservations
chmod u=rwx,g=rx,o= ~/victor/management
chmod u=rw,g=r,o= ~/victor/management/eleonora_order
chmod 640 ~/victor/management/vika_schedule
chmod u=rwx,g=rx,o= ~/archive
chmod 644 ~/archive/old_menu
chmod 755 ~/claude_monet
chmod u=rw,g=r,o= ~/claude_monet/farewell_note
chmod u=rw,g=r,o=r ~/opening_day

cp ~/opening_day ~/victor/management/opening_copy
cp -r ~/claude_monet ~/archive/claude_backup
ln -s victor/kitchen/barinov_plan ~/victor_menu
ln -s ../hall ~/victor/reception/hall_access
ln ~/victor/hall/guest_list ~/victor/hall/guest_list_copy
cat ~/victor/kitchen/max_dish ~/victor/pastry/katya_dessert > ~/victor/kitchen/tasting_menu
cat ~/victor/reception/reservations >> ~/victor/management/vika_schedule
mv ~/claude_monet/farewell_note ~/victor/management/farewell_note

ls -lR ./ |  grep "^-" | grep -v "copy"  | sort -k5,5 -n -r | head -n 5
grep -rhiE "victor|баринов" victor archive | grep -v "старт" | sort -r | head -n 6
grep -rlE "макс|кухн" victor/kitchen archive/claude_backup | wc -l
{ head -q -n 1 victor/hall/  victor/hall/opening_*; tail -q -n 1 victor/hall/guest_* victor/hall/opening_*; } | grep -iE "гост|стол" | sort
grep -v "десерт" victor/kitchen/tasting_menu | grep -E "макс|блюд" | sort -r | wc -w 
ls -lR | grep -E "^-.{9} 2 " | sort -k9 -r
ls -lR | grep "^l" | sort -k9,9 | head -n 1

rm ~/victor/management/opening_copy
rm ~/victor_menu
rm ~/victor/reception/hall_access
rm ~/victor/hall/guest_list_copy
rm ~/victor/management/farewell_note
rmdir ~/claude_monet
rm ~/archive/old_menu
rm -r ~/archive/claude_backup

git add .
git commit -m "	lab0"
git push https://github.com/sfk-coder112