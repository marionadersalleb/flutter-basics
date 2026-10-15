# Task Two — Facebook App

تطبيق فيسبوك بتلات شاشات: Splash، Login، Home.

## التشغيل

```
flutter pub get
flutter create .
flutter run
```

---

## الهيكل — widget واحد في كل ملف

```
lib/
  main.dart                      24 سطر
  common/
    app_colors.dart              الألوان الأربعة
    app_text_styles.dart         الـ 3 أنماط نص
    app_assets.dart              مسارات الصور
    app_validators.dart          قواعد التحقق
  models/
    story.dart                   الموديل + البيانات
    post.dart                    الموديل + البيانات
  screens/
    splash_screen.dart
    login_screen.dart
    home_screen.dart             35 سطر
  widgets/
    app_elevated_button.dart     الزرار الأزرق
    app_outlined_button.dart     زرار Create Account
    app_text_form_field.dart     حقل النص
    facebook_logo.dart
    meta_logo.dart
    home_app_bar.dart            الشريط + التابات
    circle_icon_button.dart      الزرار الدائري
    what_is_in_your_mind.dart    صف الكتابة
    story_list.dart              القائمة الأفقية
    create_story_card.dart       كارت Create a Story
    story_card.dart              كارت الستوري
    feed_tab.dart                تاب الرئيسية
    post_card.dart               البوست
    post_header.dart             رأس البوست
    post_actions.dart            صف التفاعلات
    empty_tab.dart               التابات الفاضية
```

**أكبر ملف 104 سطر.** المتوسط 40.

---

## القوائم مبنية بـ builder مش مكتوبة بإيد

**الستوريز** — `story_list.dart`:
```dart
itemCount: stories.length + 1,
itemBuilder: (context, index) {
  if (index == 0) return const CreateStoryCard();
  return StoryCard(story: stories[index - 1]);
},
```
الـ `+ 1` عشان أول عنصر هو كارت Create a Story. إضافة ستوري في
`story.dart` بتظهر في الشاشة **من غير أي تعديل في الكود**.

**البوستات** — `feed_tab.dart`: نفس النمط. `ListView.builder` واحد
بيشيل الـ feed كله، index صفر هو الهيدر (صف الكتابة + الستوريز)
وأي index بعده بوست.

**تابات الـ AppBar** — `home_app_bar.dart`:
```dart
tabs: tabIcons.map((icon) => Tab(icon: Icon(icon))).toList(),
```
ست أيقونات موصوفة في list واحدة بدل ست `Tab` مكتوبين بإيد.

**تفاعلات البوست** — `post_actions.dart`: نفس النمط بـ `.map()`.

---

## التحقق اتفصل لوحده

`common/app_validators.dart` فيه `AppValidators.email` و
`AppValidators.password`. شاشة الدخول بقت بتوصف الواجهة بس:

```dart
AppTextFormField(
  hintText: 'Mobile Number or Email address',
  validator: AppValidators.email,
),
```

---

## المواصفات من الـ brief

**الألوان:** `#1877F2` · `#FFFFFF` · `#898F9C` · `#242527` · خطأ `#EE403D`

**النصوص:** Title Large 24 bold أسود · Title Medium 16 bold أسود ·
Body Large 16 regular رمادي

**الزرار:** خلفية زرقا، نص أبيض 20 regular، overlay شفاف، radius 16،
padding 16

**حقل النص:** تعبئة بيضا، hint رمادي 16، نص 16 regular، radius 16،
حدود width 2 رمادي، حدود خطأ width 2 أحمر، padding 16، cursor أزرق

**الشاشة:** خلفية بيضا، padding أفقي 16

---

## كل حاجة جاية من أنهي محاضرة

| الحاجة | المحاضرة |
|---|---|
| `MaterialApp` · `Scaffold` · `AppBar` · `ColorScheme.fromSeed` | 1 |
| `Column` · `Row` · `Stack` · `Positioned` · `Expanded` · `Spacer` | 1 و 2 و 3 |
| `Container` · `Text` · `Icon` · `SizedBox` · `Padding` · `Align` | 1 |
| `BoxDecoration` · `BorderRadius` · `Border.all` · `ClipRRect` | 2 |
| `Image.asset` · `BoxFit.cover` · تسجيل الأصول | 2 |
| `ElevatedButton.styleFrom` · `TextButton` · `IconButton` | 2 |
| `SingleChildScrollView` · `GestureDetector` | 2 |
| Widgets مخصصة بـ `final` fields و `required` parameters | 3 |
| `StatefulWidget` · `setState` · `initState` | 3 |
| كلاسات ثوابت `static const` | 3 و 4 |
| موديل بـ `const constructor` وقيمة افتراضية | 3 و 4 |
| `ListView.builder` · `itemBuilder` · `scrollDirection` | 2 و 5 |
| `Navigator.push` · `MaterialPageRoute` | 5 |
| `SafeArea` · `Future.delayed` + فحص `mounted` | 5 |

### استثناءات — الـ brief طلبها بالاسم

| الحاجة | الاقتباس |
|---|---|
| `TextFormField` · `validator` · `GlobalKey<FormState>` | "It Should Take input from user with the format example@mail.domain ... if it's not it will show message to user invalid" |
| `TabBar` · `AppBar.bottom` · `DefaultTabController` · `TabBarView` | "Typically created as the AppBar.bottom part of an AppBar and in conjunction with a TabBarView" |
| `flutter_native_splash` | صفحة كاملة في الـ brief |

---

## نقاط تقنية

**`PreferredSizeWidget`** — الـ `HomeAppBar` بينفّذه عشان ينفع يتبعت
لـ `Scaffold.appBar`. الارتفاع `kToolbarHeight + 48` عشان الـ TabBar
اللي تحته.

**`DefaultTabController`** — بيربط الـ TabBar بالـ TabBarView أوتوماتيك،
فمش محتاجين نعمل `TabController` ونقفله بإيدنا.

**حالات الحدود** — `border` و `enabledBorder` و `focusedBorder` و
`errorBorder` و `focusedErrorBorder` كلهم متعرّفين. لو سيبت واحد،
Flutter بيرجع للخط الأزرق الافتراضي.

**`ClipRRect`** — الـ `borderRadius` على `BoxDecoration` بيدوّر الخلفية
بس، الصورة بتفضل طالعة من الأركان.

**الدوائر** — `BorderRadius.circular(نص المقاس)`. مقاس 40 → radius 20.

**الستوري 3:1** — `Expanded(flex: 3)` للصورة و `Expanded(flex: 1)`
للشريط الأبيض.

**فحص `mounted`** — `Future.delayed` في الـ Splash ممكن تخلص بعد ما
المستخدم يكون خرج، والفحص بيمنع الـ crash.

---

## اللوجوهات

لوجو فيسبوك و Meta مش موجودين في الصور المصدّرة، فمرسومين بالكود.
للاستبدال: صدّر `fb_logo.png` و `meta_logo.png` في `assets/images/`
وغيّر جسم `build()` في `facebook_logo.dart` و `meta_logo.dart` لـ
`Image.asset(...)`.

---

## الـ Splash الأصلي

إعدادات `flutter_native_splash` موجودة في `pubspec.yaml` معمول عليها
تعليق. للتفعيل:

1. شيل التعليق عن `flutter_native_splash: ^2.4.1`
2. شيل التعليق عن بلوك `flutter_native_splash:` في آخر الملف
3. صدّر `fb_logo.png` و `meta_logo.png`
4. `flutter pub get` وبعدين `dart run flutter_native_splash:create`

---

## تشيك ليست

**Splash**
- [ ] لوجو فيسبوك في النص، "from Meta" تحت
- [ ] بينتقل للـ Login لوحده

**Login**
- [ ] حقل الإيميل + رسالة `Invalid Email`
- [ ] رسائل خطأ الباسورد (حرف كبير/صغير/رقم/رمز)
- [ ] أيقونة إظهار الباسورد شغالة
- [ ] زرار Login أزرق radius 16
- [ ] Create Account زرار أبيض بحدود
- [ ] بيانات صح ← Home

**Home**
- [ ] AppBar فيه Facebook أزرق + 3 أزرار دائرية
- [ ] TabBar بـ 6 تابات
- [ ] صف What's in Your Mind?
- [ ] ListView أفقي ارتفاع 220 بكارت Create a Story أول واحد
- [ ] بوستات: رأس + صورة + صف تفاعلات
