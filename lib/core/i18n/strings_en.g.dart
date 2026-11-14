///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations with BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  _meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		_meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	final TranslationMetadata<AppLocale, Translations> _meta;
	@override TranslationMetadata<AppLocale, Translations> get $meta => _meta;

	/// Access flat map
	dynamic operator[](String key) => _meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations
	late final Translations$action$en action = Translations$action$en._(_root);
	late final Translations$error$en error = Translations$error$en._(_root);
	late final Translations$other$en other = Translations$other$en._(_root);
	late final Translations$screens$en screens = Translations$screens$en._(_root);
	late final Translations$home$en home = Translations$home$en._(_root);
	late final Translations$quizzes$en quizzes = Translations$quizzes$en._(_root);
	late final Translations$questions$en questions = Translations$questions$en._(_root);
}

// Path: action
class Translations$action$en {
	Translations$action$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Начать'
	String get start => 'Начать';

	/// en: 'Обновить'
	String get refresh => 'Обновить';

	/// en: 'На главную'
	String get go_home => 'На главную';
}

// Path: error
class Translations$error$en {
	Translations$error$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Ошибка'
	String get error_default => 'Ошибка';
}

// Path: other
class Translations$other$en {
	Translations$other$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Тут ничего нет'
	String get empty => 'Тут ничего нет';
}

// Path: screens
class Translations$screens$en {
	Translations$screens$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Квизы · 10'
	String get quiz_screen => 'Квизы · 10';
}

// Path: home
class Translations$home$en {
	Translations$home$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Знания — это игра'
	String get title => 'Знания — это игра';

	/// en: 'Исследуй разные категории, проверяй свои знания и открывай для себя что-то новое'
	String get description => 'Исследуй разные категории, проверяй свои знания и открывай для себя что-то новое';
}

// Path: quizzes
class Translations$quizzes$en {
	Translations$quizzes$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: '$n вопросов'
	String questions_num({required Object n}) => '${n} вопросов';

	/// en: '$n прохождений'
	String plays_num({required Object n}) => '${n} прохождений';
}

// Path: questions
class Translations$questions$en {
	Translations$questions$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Введите ответ на вопрос'
	String get answer_hint => 'Введите ответ на вопрос';

	/// en: 'Проверить результат'
	String get check_answers => 'Проверить результат';

	/// en: 'Результат'
	String get result_title => 'Результат';

	/// en: 'Правильных ответов: $correctCount из $questionsNum'
	String correct_answers_count({required Object correctCount, required Object questionsNum}) => 'Правильных ответов: ${correctCount} из ${questionsNum}';

	/// en: 'Посмотреть ответы'
	String get show_correct_answers => 'Посмотреть ответы';

	/// en: 'Правильный ответ'
	String get correct_answer => 'Правильный ответ';

	/// en: 'Пояснение'
	String get explanation => 'Пояснение';

	/// en: 'Часть вопросов не проверяется автоматически'
	String get auto_check_note => 'Часть вопросов не проверяется автоматически';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
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
