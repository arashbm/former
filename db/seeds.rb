# encoding: UTF-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
arash = Admin.create(email: 'arashbm@gmail.com', password: 'salam123')

reshte_morede_nazar = Field.where(name: 'رشته‌ی مورد نظر', description: 'رشته‌ای که درخواست تحصیل همزمان در آن را دارید.', field_type: 'major').first_or_create!

gerayeshe = Field.where(name: 'گرایش  مورد نظر', description: 'گرایش  مورد نظر‌تان در رشته‌ی مقصد را مشخص کنید. اگر رشته‌ی مقصد نیازی به انتخاب گرایش ندارد، می‌توانید این فیلد را خالی بگذارید.', field_type: 'minor', optional: true ).first_or_create!

bande_aeenname = Field.where(name: 'کدام بند آیین نامه‌ی تحصیل همزام شامل شما می‌شود؟', description: 'در آیین‌نامه‌ی تحصیل همزمان در دو رشته چهار گروه از دانشجویان امکان درخواست تحصیل همزمان دارند. بر اساس اینکه شامل کدام گروه می‌شوید تصویر مدارک مورد نیاز برای احراز یکی از این شرایط را ضمیمه‌ی این فرم کنید.', field_type: 'dual-major-laws').first_or_create!

karname = Field.where(name: 'تصویر آخرین کارنامه‌ی تحصیلی', description: '', field_type: 'general-file').first_or_create!
karname = Field.where(name: 'مشخصات تفضیلی از فعالیت‌های پژوهشی (CV)', description: 'می‌توانید از کاررگ شماره‌ی ۹ به عنوان نمونه استفاده کنید.', field_type: 'general-file').first_or_create!
madrak1 = Field.where(name: 'مدرک احراز شرایط شماره‌ی (۱)', description: '', field_type: 'general-file').first_or_create!
madrak2 = Field.where(name: 'مدرک احراز شرایط شماره‌ی (۲)', description: '', field_type: 'general-file', optional: true).first_or_create!
madrak3 = Field.where(name: 'مدرک احراز شرایط شماره‌ی (۳)', description: '', field_type: 'general-file', optional: true).first_or_create!
