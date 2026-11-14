///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsRu with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsRu({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  _meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ru,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		_meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ru>.
	final TranslationMetadata<AppLocale, Translations> _meta;
	@override TranslationMetadata<AppLocale, Translations> get $meta => _meta;

	/// Access flat map
	@override dynamic operator[](String key) => _meta.getTranslation(key);

	late final TranslationsRu _root = this; // ignore: unused_field

	@override 
	TranslationsRu $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsRu(meta: meta ?? this.$meta);

	// Translations
	@override late final _Translations$action$ru action = _Translations$action$ru._(_root);
	@override late final _Translations$error$ru error = _Translations$error$ru._(_root);
	@override late final _Translations$other$ru other = _Translations$other$ru._(_root);
	@override late final _Translations$screens$ru screens = _Translations$screens$ru._(_root);
	@override late final _Translations$home$ru home = _Translations$home$ru._(_root);
	@override late final _Translations$quizzes$ru quizzes = _Translations$quizzes$ru._(_root);
	@override late final _Translations$questions$ru questions = _Translations$questions$ru._(_root);
}

// Path: action
class _Translations$action$ru implements Translations$action$en {
	_Translations$action$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get start => 'Начать';
	@override String get refresh => 'Обновить';
	@override String get go_home => 'На главную';
}

// Path: error
class _Translations$error$ru implements Translations$error$en {
	_Translations$error$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get error_default => 'Ошибка';
}

// Path: other
class _Translations$other$ru implements Translations$other$en {
	_Translations$other$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get empty => 'Тут ничего нет';
}

// Path: screens
class _Translations$screens$ru implements Translations$screens$en {
	_Translations$screens$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get quiz_screen => 'Квизы · 10';
}

// Path: home
class _Translations$home$ru implements Translations$home$en {
	_Translations$home$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Знания — это игра';
	@override String get description => 'Исследуй разные категории, проверяй свои знания и открывай для себя что-то новое';
}

// Path: quizzes
class _Translations$quizzes$ru implements Translations$quizzes$en {
	_Translations$quizzes$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String questions_num({required Object n}) => '${n} вопросов';
	@override String plays_num({required Object n}) => '${n} прохождений';
}

// Path: questions
class _Translations$questions$ru implements Translations$questions$en {
	_Translations$questions$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get answer_hint => 'Введите ответ на вопрос';
	@override String get check_answers => 'Проверить результат';
	@override String get result_title => 'Результат';
	@override String correct_answers_count({required Object correctCount, required Object questionsNum}) => 'Правильных ответов: ${correctCount} из ${questionsNum}';
	@override String get show_correct_answers => 'Посмотреть ответы';
	@override String get correct_answer => 'Правильный ответ';
	@override String get explanation => 'Пояснение';
	@override String get auto_check_note => 'Часть вопросов не проверяется автоматически';
}

/// The flat map containing all translations for locale <ru>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsRu {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'action.start' => 'Начать',
			'action.refresh' => 'Обновить',
			'action.go_home' => 'На главную',
			'error.error_default' => 'Ошибка',
			'other.empty' => 'Тут ничего нет',
			'screens.quiz_screen' => 'Квизы · 10',
			'home.title' => 'Знания — это игра',
			'home.description' => 'Исследуй разные категории, проверяй свои знания и открывай для себя что-то новое',
			'quizzes.questions_num' => ({required Object n}) => '${n} вопросов',
			'quizzes.plays_num' => ({required Object n}) => '${n} прохождений',
			'questions.answer_hint' => 'Введите ответ на вопрос',
			'questions.check_answers' => 'Проверить результат',
			'questions.result_title' => 'Результат',
			'questions.correct_answers_count' => ({required Object correctCount, required Object questionsNum}) => 'Правильных ответов: ${correctCount} из ${questionsNum}',
			'questions.show_correct_answers' => 'Посмотреть ответы',
			'questions.correct_answer' => 'Правильный ответ',
			'questions.explanation' => 'Пояснение',
			'questions.auto_check_note' => 'Часть вопросов не проверяется автоматически',
			_ => null,
		};
	}
}
