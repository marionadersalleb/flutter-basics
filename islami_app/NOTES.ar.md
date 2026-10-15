# Islami App — Onboarding + Sebha

مهمة الـ 10 أيام من دبلومة Route: شاشة الـ Onboarding وشاشة السبحة.

## التشغيل

```
flutter pub get
flutter create .
flutter run
```

---

## الملفات — widget واحد في كل ملف

```
lib/
  main.dart                          الراوتس          26 سطر
  common/
    app_colors.dart                  الذهبي والأسود والأبيض
    app_text_styles.dart             أنماط النصوص
    app_assets.dart                  مسارات الصور
    app_theme.dart                   ThemeData + خط Janna LT
  models/
    onboarding_page_data.dart        الخمس شرايح كبيانات
    dhikr.dart                       التسبيحات + الرقم المستهدف
  screens/
    onboarding_screen.dart           الـ PageView والأزرار   128 سطر
    sebha_screen.dart                العدّاد والدوران        113 سطر
  widgets/
    islami_header.dart               اللوجو الذهبي
    onboarding_page_item.dart        شريحة واحدة
    onboarding_text_button.dart      Back / Next / Finish
    sebha_header.dart                الرأس الثابت
    sebha_body.dart                  الحلقة الدوّارة
    dhikr_counter.dart               النص والرقم
```

**أكبر ملف 128 سطر.** المتوسط 40.

---

## ١. الـ Onboarding

### الشرايح بيانات مش كود مكرر

الخمس شرايح موصوفة في `onboarding_page_data.dart`:

```dart
const List<OnboardingPageData> onboardingPages = [
  OnboardingPageData(image: ..., title: ..., subtitle: ...),
  ...
];
```

والشاشة بتلف عليها:

```dart
PageView.builder(
  itemCount: onboardingPages.length,
  itemBuilder: (context, index) =>
      OnboardingPageItem(page: onboardingPages[index]),
)
```

**إضافة شريحة سادسة = سطر واحد في ملف البيانات.** الشاشة مش هتتغير.

### منطق الأزرار

| الشرط | السلوك |
|---|---|
| `isFirstPage` | زرار Back مخفي، ومكانه `SizedBox(width: 64)` عشان النقط تفضل في النص |
| `isLastPage` | الزرار بيتحوّل من `Next` لـ `Finish` |
| ضغط `Finish` | `pushReplacementNamed` عشان المستخدم ميرجعش للمقدمة |

الزرارات التلاتة نفس الـ widget — `OnboardingTextButton` — الاسم والـ action بس اللي بيتغيروا.

### المؤشر

`SmoothPageIndicator` بـ `ExpandingDotsEffect` — النقطة النشطة بتتمدد لشكل كبسولة، زي التصميم. مربوط بنفس الـ `PageController` فبيتحرك مع السحب لوحده.

---

## ٢. السبحة

### الرأس ثابت والجسم بيلف

ده شرط صريح في التاسك: *"the header remains completely static and fixed in its position"*.

التنفيذ: الـ `SebhaHeader` **برّه** الـ widget الدوّار:

```dart
Column(
  children: [
    const SebhaHeader(),              // لا يدور
    Stack(
      children: [
        SebhaBody(turns: turns),      // يدور
        DhikrCounter(...),            // لا يدور
      ],
    ),
  ],
)
```

### الدوران

```dart
AnimatedRotation(
  turns: turns,
  duration: const Duration(milliseconds: 250),
  curve: Curves.easeOut,
  child: Image.asset(AppAssets.sebhaBody),
)
```

الـ `AnimatedRotation` بيتحرّك لوحده بين أي قيمتين. **مش محتاج `AnimationController`** يتعمل ويتقفل في `dispose`.

خطوة الدوران = `1 / 33` لفة، يعني خرزة واحدة لكل ضغطة — فالحركة متطابقة مع العدّ.

### المنطق

```dart
void onSebhaTap() {
  setState(() {
    turns += turnPerTap;
    count++;

    if (count == Dhikr.target) {
      count = 0;
      phraseIndex = (phraseIndex + 1) % Dhikr.phrases.length;
    }
  });
}
```

الـ `%` بيرجّع للتسبيحة الأولى بعد التالتة، فالدورة مستمرة بلا نهاية.

**ملاحظة:** `turns` مبيترجعش صفر عند الـ reset. الحلقة بتفضل بتلف في نفس الاتجاه — لو صفّرناها كانت هترجع للخلف بشكل مفاجئ.

### الاستجابة لحجم الشاشة

التاسك بيطلب *"Responsive UI: Designed to look consistent across
different screen sizes"*. حجم حلقة الخرز محسوب من المساحة المتاحة
مش رقم ثابت:

```dart
LayoutBuilder(
  builder: (context, constraints) {
    final double ringSize = constraints.maxHeight * 0.55;
    return buildSebhaColumn(ringSize);
  },
)
```

نفس نمط محاضرة 7 مع الكاروسيل: الـ `Expanded` بياخد المساحة،
والـ `LayoutBuilder` بيقراها، والقيمة بتتمرر كرقم.

---

---

## كل حاجة جاية من أنهي محاضرة

| الحاجة | المحاضرة |
|---|---|
| `MaterialApp` · `Scaffold` · `ColorScheme.fromSeed` | 1 |
| `Column` · `Row` · `Stack` · `Expanded` · `SizedBox` | 1 و 2 |
| `StackFit.expand` · `Image.asset` · `BoxFit` | 2 و 7 |
| `BoxDecoration` · `BorderRadius` | 2 |
| `TextButton.styleFrom` · `overlayColor` | 2 |
| `GestureDetector` | 2 |
| Widgets مخصصة بـ `required` parameters | 3 |
| `StatefulWidget` · `setState` · `dispose` | 3 |
| كلاسات ثوابت `static const` | 3 و 4 |
| Collection-if (`if (page.subtitle.isNotEmpty)`) | 4 |
| Named routes · `pushReplacementNamed` | 5 |
| `PageController` · `nextPage` · `previousPage` | 5 |
| `PageView.builder` · `onPageChanged` | 5 |
| الخط المخصص + `AppTheme` | 6 |

### استثناءات — التاسك طلبها بالاسم

| الحاجة | الاقتباس |
|---|---|
| `smooth_page_indicator` | "Indicators: Used SmoothPageIndicator" |
| `AnimatedRotation` | "the Sebha body rotates slightly" — دوران متحرك مش مذكور في المحاضرات |

---

## الأصول

الصور الأصلية كانت **14 ميجا**. أكبرها
`moon-light-shine-through-window...jpg` بمقاس 7680×4320 و 10 ميجا، و
`reading.png` بمقاس 4076×3612.

اتصغّرت لـ 700–900px فبقت **1.6 ميجا**. صورة بالمقاس الأصلي ممكن تعمل
out-of-memory على موبايل متوسط.

**الخط:** `Janna LT Bold.ttf` مسجّل في `pubspec.yaml` بوزن 700 ومطبّق
عالمياً من `AppTheme`.

**رأس السبحة:** مفيش أصل مصدّر له، فمرسوم بالكود في `sebha_header.dart`.
لو التصميم وفّره بعدين، استبدل جسم `build()` بـ `Image.asset(...)`.

---

## تشيك ليست التسليم

**Onboarding**
- [ ] 5 شرايح بتتسحب يمين وشمال
- [ ] اللوجو الذهبي فوق كل شريحة
- [ ] الشريحة الأولى مفيهاش Back
- [ ] الشريحة الأخيرة فيها Finish مش Next
- [ ] النقط بتتحرك مع السحب ومع الأزرار
- [ ] Finish بينقل للسبحة ومينفعش ترجع

**Sebha**
- [ ] خلفية بصورة فوقها طبقة غامقة
- [ ] الرأس ثابت تماماً أثناء الدوران
- [ ] كل ضغطة: العدّاد +1 والحلقة بتلف خرزة
- [ ] عند 33: العدّاد يصفّر والتسبيحة تتغير
- [ ] الدورة: سبحان الله ← الحمد لله ← الله أكبر ← سبحان الله

**التسليم**
- [ ] الكود على GitHub
- [ ] تسجيل شاشة للتطبيق شغال (مطلوب صراحة في التاسك)
