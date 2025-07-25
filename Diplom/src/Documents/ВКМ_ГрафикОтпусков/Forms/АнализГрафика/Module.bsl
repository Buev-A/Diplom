
&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)  
	
	Данные = ПолучитьИзВременногоХранилища(Параметры.Адрес);      
	
	Серия = АнализГрафика.УстановитьСерию("Отпуск");   
	
	Для каждого Строка Из Данные Цикл
		
		Если Тип("Дата") = ТипЗнч(Строка) Тогда
			Продолжить;
		КонецЕсли;
		
		Точка = АнализГрафика.УстановитьТочку(Строка.Сотрудник);  
		
		ОтпускСотрудника = АнализГрафика.ПолучитьЗначение(Точка, Серия);  
		
		ИнтервалОтпуска = ОтпускСотрудника.Добавить();
		ИнтервалОтпуска.Начало = Строка.ДатаНачала;
		ИнтервалОтпуска.Конец = Строка.ДатаОкончания;     
		
		Шкала = АнализГрафика.ОбластьПостроения.ШкалаВремени.Элементы[0];
		Шкала.Метки.Очистить();
		МеткаВремени = Шкала.Метки.Добавить(НачалоДня(ТекущаяДата()));
		МеткаВремени.Текст = "Текущая дата " + Формат(ТекущаяДата(), "Дф=dd.MM.yy");
		МеткаВремени.ЦветЛинии = WebЦвета.Красный;
		МеткаВремени.ЦветТекста = WebЦвета.Красный;
		
		АнализГрафика.Обновление = Истина;
		
	КонецЦикла;
	
КонецПроцедуры
