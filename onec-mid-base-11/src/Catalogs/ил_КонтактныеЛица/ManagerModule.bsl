Процедура ОбработкаПолученияПолейПредставления(Поля, СтандартнаяОбработка)
	СтандартнаяОбработка = Ложь;
	Поля.Добавить("Наименование");
	Поля.Добавить("ДействуетНаОсновании");
КонецПроцедуры

Процедура ОбработкаПолученияПредставления(Данные, Представление, СтандартнаяОбработка)
	СтандартнаяОбработка = Ложь;
	Представление = ?(ЗначениеЗаполнено(Данные.ДействуетНаОсновании), Данные.Наименование + " " + Данные.ДействуетНаОсновании, Данные.Наименование);
КонецПроцедуры