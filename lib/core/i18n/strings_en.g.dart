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

	/// en: 'Start'
	String get start => 'Start';

	/// en: 'Refresh'
	String get refresh => 'Refresh';

	/// en: 'Home'
	String get go_home => 'Home';
}

// Path: error
class Translations$error$en {
	Translations$error$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Error'
	String get error_default => 'Error';
}

// Path: other
class Translations$other$en {
	Translations$other$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'There's nothing here'
	String get empty => 'There\'s nothing here';
}

// Path: screens
class Translations$screens$en {
	Translations$screens$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Quizzes · 10'
	String get quiz_screen => 'Quizzes · 10';
}

// Path: home
class Translations$home$en {
	Translations$home$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Knowledge Is a Game'
	String get title => 'Knowledge Is a Game';

	/// en: 'Explore different categories, test your knowledge, and discover something new'
	String get description => 'Explore different categories, test your knowledge, and discover something new';

	/// en: 'All quizzes are in English'
	String get locale_note => 'All quizzes are in English';
}

// Path: quizzes
class Translations$quizzes$en {
	Translations$quizzes$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: '$n questions'
	String questions_num({required Object n}) => '${n} questions';

	/// en: '$n plays'
	String plays_num({required Object n}) => '${n} plays';
}

// Path: questions
class Translations$questions$en {
	Translations$questions$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Enter your answer'
	String get answer_hint => 'Enter your answer';

	/// en: 'Check your results'
	String get check_answers => 'Check your results';

	/// en: 'Result'
	String get result_title => 'Result';

	/// en: 'Correct answers: $correctCount out of $questionsNum'
	String correct_answers_count({required Object correctCount, required Object questionsNum}) => 'Correct answers: ${correctCount} out of ${questionsNum}';

	/// en: 'View answers'
	String get show_correct_answers => 'View answers';

	/// en: 'Correct answer'
	String get correct_answer => 'Correct answer';

	/// en: 'Explanation'
	String get explanation => 'Explanation';

	/// en: 'Some questions are not checked automatically'
	String get auto_check_note => 'Some questions are not checked automatically';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'action.start' => 'Start',
			'action.refresh' => 'Refresh',
			'action.go_home' => 'Home',
			'error.error_default' => 'Error',
			'other.empty' => 'There\'s nothing here',
			'screens.quiz_screen' => 'Quizzes · 10',
			'home.title' => 'Knowledge Is a Game',
			'home.description' => 'Explore different categories, test your knowledge, and discover something new',
			'home.locale_note' => 'All quizzes are in English',
			'quizzes.questions_num' => ({required Object n}) => '${n} questions',
			'quizzes.plays_num' => ({required Object n}) => '${n} plays',
			'questions.answer_hint' => 'Enter your answer',
			'questions.check_answers' => 'Check your results',
			'questions.result_title' => 'Result',
			'questions.correct_answers_count' => ({required Object correctCount, required Object questionsNum}) => 'Correct answers: ${correctCount} out of ${questionsNum}',
			'questions.show_correct_answers' => 'View answers',
			'questions.correct_answer' => 'Correct answer',
			'questions.explanation' => 'Explanation',
			'questions.auto_check_note' => 'Some questions are not checked automatically',
			_ => null,
		};
	}
}
