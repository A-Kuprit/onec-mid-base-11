
 
#Область КОНТАКТНОЕ_ЛИЦО
	
Процедура ДобавитьКонтактноеЛицоВГруппуШапкиПраво(Форма)
	ПолеВвода             = Форма.Элементы.Добавить("КонтактноеЛицо", Тип("ПолеФормы"), Форма.Элементы.ГруппаШапкаПраво);
	ПолеВвода.Вид         = ВидПоляФормы.ПолеВвода;
	ПолеВвода.ПутьКДанным = "Объект.ил_КонтактноеЛицо";		
КонецПроцедуры

Процедура ВставитьКонтактноеЛицоПередПолемДоговор(Форма)
	ПолеВвода             = Форма.Элементы.Вставить("КонтактноеЛицо", Тип("ПолеФормы"), , Форма.Элементы.Договор);
	ПолеВвода.Вид         = ВидПоляФормы.ПолеВвода;
	ПолеВвода.ПутьКДанным = "Объект.ил_КонтактноеЛицо";	
КонецПроцедуры

Процедура ДополнитьФормуКонтактнымЛицом(Форма) Экспорт	
	ИмяФормы = Форма.ИмяФормы;
	
	Если ИмяФормы = "Документ.ЗаказПокупателя.Форма.ФормаДокумента" Тогда
		ДобавитьКонтактноеЛицоВГруппуШапкиПраво(Форма);	
	ИначеЕсли ИмяФормы = "Документ.ПоступлениеТоваровУслуг.Форма.ФормаДокумента" Тогда
		ДобавитьКонтактноеЛицоВГруппуШапкиПраво(Форма);	
	ИначеЕсли ИмяФормы = "Документ.РеализацияТоваровУслуг.Форма.ФормаДокумента" Тогда 
		ДобавитьКонтактноеЛицоВГруппуШапкиПраво(Форма);	
	ИначеЕсли ИмяФормы = "Документ.ОплатаОтПокупателя.Форма.ФормаДокумента" Тогда 
		ВставитьКонтактноеЛицоПередПолемДоговор(Форма);	
	ИначеЕсли ИмяФормы = "Документ.ОплатаПоставщику.Форма.ФормаДокумента" Тогда 
		ВставитьКонтактноеЛицоПередПолемДоговор(Форма);	
	КонецЕсли; 	
КонецПроцедуры

#КонецОбласти

#Область СОГЛАСОВАННАЯ_СКИДКА

Процедура ДобавитьСогласованнуюСкидкуВГруппуШапкиЛево(Форма)
	ГруппаСкидки                     = Форма.Элементы.Добавить("ГруппаСкидки", Тип("ГруппаФормы"), Форма.Элементы.ГруппаШапкаЛево); 
	ГруппаСкидки.Вид                 = ВидГруппыФормы.ОбычнаяГруппа; 
	ГруппаСкидки.Группировка         = ГруппировкаПодчиненныхЭлементовФормы.ГоризонтальнаяВсегда;
	ГруппаСкидки.ОтображатьЗаголовок = Ложь;
    //	
	ПолеВвода             = Форма.Элементы.Добавить("СогласованнаяСкидка", Тип("ПолеФормы"), ГруппаСкидки);
	ПолеВвода.Вид         = ВидПоляФормы.ПолеВвода;
	ПолеВвода.ПутьКДанным = "Объект.ил_СогласованнаяСкидка";
	ПолеВвода.УстановитьДействие("ПриИзменении", "СогласованнаяСкидкаПриИзменении");
	//
	КомандаСкидки             = Форма.Команды.Добавить("КомандаПересчетСкидкиВТЧ");
	КомандаСкидки.Заголовок   = "Пересчет скидки в тч документа";
	КомандаСкидки.Действие    = "КомандаПересчетСкидкиВТЧ";
	КомандаСкидки.Картинка    = БиблиотекаКартинок.Обновить;
	КомандаСкидки.Отображение = ОтображениеКнопки.КартинкаИТекст;
    //
	КнопкаФормы            = Форма.Элементы.Добавить("ПересчитатьСкидкуВТЧ", Тип("КнопкаФормы"), ГруппаСкидки);
	КнопкаФормы.Вид        = ВидКнопкиФормы.ОбычнаяКнопка;
	КнопкаФормы.ИмяКоманды = КомандаСкидки.Имя;	
КонецПроцедуры

Процедура ДополнитьФормуПолемСогласованнаяСкидка(Форма) Экспорт 	
	ИмяФормы = Форма.ИмяФормы;
	
	Если ИмяФормы = "Документ.ЗаказПокупателя.Форма.ФормаДокумента" Тогда
		ДобавитьСогласованнуюСкидкуВГруппуШапкиЛево(Форма);
	КонецЕсли;		
КонецПроцедуры

#КонецОбласти