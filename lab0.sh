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

echo "Баринов проверяет кухню ресторана Victor" > ~/victor/kitchen/barinov_plan
echo "Лёва распределяет поваров по рабочим местам" >> /workspace/debian-2/lab0/victor/kitchen/barinov_plan
echo "Новое меню готовят к вечернему открытию" >> /workspace/debian-2/lab0/victor/kitchen/barinov_plan

echo "Макс предлагает утку с новым соусом" > /workspace/debian-2/lab0/victor/kitchen/max_dish
echo "Баринов разрешает приготовить пробную порцию" >> /workspace/debian-2/lab0/victor/kitchen/max_dish
echo "Блюдо подадут первым гостям ресторана Victor" >> /workspace/debian-2/lab0/victor/kitchen/max_dish

echo "Катя готовит шоколадный десерт" > /workspace/debian-2/lab0/victor/pastry/katya_dessert
echo "Украшение собирают перед самой подачей" >> /workspace/debian-2/lab0/victor/pastry/katya_dessert
echo "Элеонора ждёт результат дегустации" >> /workspace/debian-2/lab0/victor/pastry/katya_dessert

echo "Первый стол оставлен для Элеоноры" > /workspace/debian-2/lab0/victor/hall/opening_tables
echo "Второй стол подготовлен для Нагиева" >> /workspace/debian-2/lab0/victor/hall/opening_tables
echo "Большой стол займёт команда ресторана" >> /workspace/debian-2/lab0/victor/hall/opening_tables

echo "Элеонора Андреевна прибывает к открытию" > /workspace/debian-2/lab0/victor/hall/guest_list
echo "Дмитрий Нагиев приглашён на ужин" >> /workspace/debian-2/lab0/victor/hall/guest_list
echo "Денис выступает для гостей вечером" >> /workspace/debian-2/lab0/victor/hall/guest_list

echo "Столик четыре забронирован на семь часов" > /workspace/debian-2/lab0/victor/reception/reservations
echo "Столик шесть нужен постоянным гостям" >> /workspace/debian-2/lab0/victor/reception/reservations
echo "Вика подтверждает каждую бронь" >> /workspace/debian-2/lab0/victor/reception/reservations

echo "Элеонора требует закончить подготовку вовремя" > /workspace/debian-2/lab0/victor/management/eleonora_order
echo "Зал должен быть готов до приезда гостей" >> /workspace/debian-2/lab0/victor/management/eleonora_order
echo "Баринов лично представляет праздничное меню" >> /workspace/debian-2/lab0/victor/management/eleonora_order

echo "Утром проверить работу кухни" > /workspace/debian-2/lab0/victor/management/vika_schedule
echo "Днём провести собрание официантов" >> /workspace/debian-2/lab0/victor/management/vika_schedule
echo "Вечером встретить первых гостей" >> /workspace/debian-2/lab0/victor/management/vika_schedule

echo "Луковый суп из Claude Monet" > /workspace/debian-2/lab0/archive/old_menu
echo "Мильфей от Луи" >> /workspace/debian-2/lab0/archive/old_menu
echo "Фирменное мясо от Баринова" >> /workspace/debian-2/lab0/archive/old_menu

echo "Команда прощается с рестораном Claude Monet" > /workspace/debian-2/lab0/claude_monet/farewell_note
echo "Старые рецепты сохраняются в архиве" >> /workspace/debian-2/lab0/claude_monet/farewell_note
echo "Макс обещает не забывать первую кухню" >> /workspace/debian-2/lab0/claude_monet/farewell_note

echo "Ресторан Victor открывается вечером" > /workspace/debian-2/lab0/opening_day
echo "Баринов волнуется за новую команду" >> /workspace/debian-2/lab0/opening_day
echo "Вика проверяет последние приготовления" >> /workspace/debian-2/lab0/opening_day

chmod 755 /workspace/debian-2/lab0/victor
chmod u=rwx,g=rx,o= /workspace/debian-2/lab0/victor/kitchen
chmod 640 /workspace/debian-2/lab0/victor/kitchen/barinov_plan
chmod u=rw,g=r,o= /workspace/debian-2/lab0/victor/kitchen/max_dish
chmod 750 /workspace/debian-2/lab0/victor/pastry
chmod u=rw,g=r,o= /workspace/debian-2/lab0/victor/pastry/katya_dessert
chmod u=rwx,g=rx,o= /workspace/debian-2/lab0/victor/hall
chmod 644 /workspace/debian-2/lab0/victor/hall/opening_tables
chmod u=rw,g=r,o=r /workspace/debian-2/lab0/victor/hall/guest_list
chmod 750 /workspace/debian-2/lab0/victor/reception
chmod 640 /workspace/debian-2/lab0/victor/reception/reservations
chmod u=rwx,g=rx,o= /workspace/debian-2/lab0/victor/management
chmod u=rw,g=r,o= /workspace/debian-2/lab0/victor/management/eleonora_order
chmod 640 /workspace/debian-2/lab0/victor/management/vika_schedule
chmod u=rwx,g=rx,o= /workspace/debian-2/lab0/archive
chmod 644 /workspace/debian-2/lab0/archive/old_menu
chmod 755 /workspace/debian-2/lab0/claude_monet
chmod u=rw,g=r,o= /workspace/debian-2/lab0/claude_monet/farewell_note
chmod u=rw,g=r,o=r /workspace/debian-2/lab0/opening_day

cp /workspace/debian-2/lab0/opening_day /workspace/debian-2/lab0/victor/management/opening_copy
cp -r /workspace/debian-2/lab0/claude_monet /workspace/debian-2/lab0/archive/claude_backup
ln -s victor/kitchen/barinov_plan /workspace/debian-2/lab0/victor_menu
ln -s ../hall /workspace/debian-2/lab0/victor/reception/hall_access
ln /workspace/debian-2/lab0/victor/hall/guest_list /workspace/debian-2/lab0/victor/hall/guest_list_copy
cat /workspace/debian-2/lab0/victor/kitchen/max_dish /workspace/debian-2/lab0/victor/pastry/katya_dessert > /workspace/debian-2/lab0/victor/kitchen/tasting_menu
cat /workspace/debian-2/lab0/victor/reception/reservations >> /workspace/debian-2/lab0/victor/management/vika_schedule
mv /workspace/debian-2/lab0/claude_monet/farewell_note /workspace/debian-2/lab0/victor/management/farewell_note

ls -lR ./ |  grep "^-" | grep -v "copy"  | sort -k5,5 -n -r | head -n 5
grep -rhiE "victor|баринов" victor archive | grep -v "старт" | sort -r | head -n 6
grep -rlE "макс|кухн" victor/kitchen archive/claude_backup | wc -l
{ head -q -n 1 victor/hall/  victor/hall/opening_*; tail -q -n 1 victor/hall/guest_* victor/hall/opening_*; } | grep -iE "гост|стол" | sort
grep -v "десерт" victor/kitchen/tasting_menu | grep -E "макс|блюд" | sort -r | wc -w 
ls -lR | grep -E "^-.{9} 2 " | sort -k9 -r
ls -lR | grep "^l" | sort -k9,9 | head -n 1

rm /workspace/debian-2/lab0/victor/management/opening_copy
rm /workspace/debian-2/lab0/victor_menu
rm /workspace/debian-2/lab0/victor/reception/hall_access
rm /workspace/debian-2/lab0/victor/hall/guest_list_copy
rm /workspace/debian-2/lab0/victor/management/farewell_note
rmdir /workspace/debian-2/lab0/claude_monet
rm /workspace/debian-2/lab0/archive/old_menu
rm -r /workspace/debian-2/lab0/archive/claude_backup

git add .
git commit -m "	lab0"
git push https://github.com/sfk-coder112