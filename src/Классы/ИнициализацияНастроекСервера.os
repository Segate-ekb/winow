#Использовать autumn-logos

&Лог("winow.settingsInit")
Перем Лог;

&Пластилин(Значение = "Контроллер", Тип = "Массив")
Перем Контроллы;

&Пластилин Перем РегистраторКаталогаФайлов;
&Пластилин Перем СборщикМаршрутов;
&Пластилин Перем ВебСервер;

&Деталька("winow.КаталогиСФайлами")
Перем КаталогиСФайлами;

&Деталька(Значение = "winow.АвтоСтарт", ЗначениеПоУмолчанию = Ложь)
Перем АвтоСтарт;

&Рогатка
Процедура ПриСозданииОбъекта() 
	
КонецПроцедуры

Процедура ПриЗапускеПриложения() Экспорт

	ИнициализацияКонтролов();

	АвтоСтарт();

КонецПроцедуры

Процедура ИнициализацияКонтролов() Экспорт

	Лог.Отладка("Регистрация контролов %1", Контроллы.Количество());
	
	Для Каждого Контролл из Контроллы Цикл
		СборщикМаршрутов.НайтиИЗарегистрироватьМаршруты(Контролл);
	КонецЦикла;

	РегистраторКаталогаФайлов.ОбновтитьСтатичныеФайлы();

КонецПроцедуры

Процедура АвтоСтарт()
	Лог.Отладка("Обработка АвтоСтарта приложения");
	
	Лог.Отладка("Автостарт: %1", АвтоСтарт);
	Если АвтоСтарт = Истина Тогда
		ВебСервер.Старт();
	Иначе
		Лог.Отладка("Пропускаем старт");	
	КонецЕсли;
	
КонецПроцедуры