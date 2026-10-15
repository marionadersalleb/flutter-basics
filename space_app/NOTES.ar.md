# Task Four — Space App

تطبيق استكشاف المجموعة الشمسية بتلات شاشات.

## التشغيل

```
flutter pub get
flutter create .
flutter run
```

**مهم:** الـ 3D شغال على موبايل حقيقي أو محاكي بس — مش على Chrome من غير إعداد إضافي.

---

## الملفات — widget واحد في كل ملف

```
lib/
  main.dart                      الراوتس
  common/
    app_colors.dart              #0E0E0E · #FFFFFF · #EE403D
    app_text_styles.dart         Title Large · Body Large · Button · Display
  models/
    planet.dart                  الموديل + الصفوف اللي بيوصف بيها نفسه
    planets_data.dart            بيانات الـ 9 كواكب
  screens/
    explore_screen.dart          Screen Zero      74 سطر
    home_screen.dart             Screen One      109 سطر
    planet_details_screen.dart   Screen Two       54 سطر
  widgets/
    app_button.dart              الزرار الأحمر الطويل
    action_button.dart           الزرار الدائري
    screen_gradient.dart         الحجاب الغامق فوق الصور
    stacked_app_bar.dart         الـ AppBar بطبقاته
    planet_page_item.dart        صفحة واحدة في الـ PageView
    planet_selector.dart         الاسم بين السهمين
    planet_model_viewer.dart     عارض الـ 3D
    planet_info_row.dart         صف بيانات واحد
    planet_info_table.dart       الجدول كله
```

**أكبر ملف 109 سطر.** المتوسط 45.

---

## الجدول مبني من البيانات مش مكتوب بإيد

الكواكب بتوصف صفوفها بنفسها في `planet.dart`:

```dart
List<PlanetInfo> get infoRows => [
      PlanetInfo('Distance from Sun (km)', _format(distanceFromSun)),
      PlanetInfo('Length of Day (hours)', _format(lengthOfDay)),
      ...
    ];
```

والشاشة بتلف عليها:

```dart
Column(
  children: planet.infoRows
      .map((info) => PlanetInfoRow(info: info))
      .toList(),
)
```

إضافة صف تامن = **سطر واحد في الموديل**، بدون أي تعديل في الشاشة.

---

## التدرّج اللوني اتكتب مرة واحدة

كان مكتوب مرتين — في الـ AppBar وفي Screen Zero. بقى `ScreenGradient`
بقيم افتراضية و parameter اختياري للألوان.

**وزرار الرجوع** في الـ AppBar بقى بيستخدم نفس `ActionButton` بتاع
السهمين، بـ `size: 40` بدل نسخة تانية من نفس الزرار.

---

## المواصفات من الـ brief

**الألوان:** أسود `#0E0E0E` · أبيض `#FFFFFF` · أحمر `#EE403D`

**النصوص:**
- Title Large — 24 bold أبيض
- Body Large — 16 regular أبيض
- عنوان Screen Zero — 48 bold أبيض
- نص الأزرار — 20 bold

**الزرار الرئيسي:** خلفية حمرا، padding 16، elevation 0، شكل دائري الأطراف

**Action Button:** دائري، خلفية حمرا، أيقونة بيضا مقاس 22

**الشاشة:** خلفية `#0E0E0E`، padding أفقي 16

---

## الشاشات

### Screen Zero — `explore_screen.dart`
تلات طبقات في `Stack`:
1. صورة تملى الشاشة كلها — `Positioned.fill` + `BoxFit.cover`
2. `Explore The Universe` في النص — 48 bold
3. زرار `Explore` + سهم تحت — بينقل لـ Home

### Screen One — `home_screen.dart`
- `StackedAppBar`: صورة + تدرّج + `Explore` فوق في النص + السؤال تحت على الشمال
- `PageView.builder` بالكواكب التسعة — السحب بيغيّر الكوكب
- اسم الكوكب في النص بين زرارين دائريين أحمر
- الزرار التحتاني `Explore {الكوكب}` — الاسم بيتغير مع السحب

### Screen Two — `planet_details_screen.dart`
- `StackedAppBar` بزرار رجوع، العنوان الفوقاني اسم الكوكب والتحتاني الـ title
- الموديل الـ 3D بـ `Flutter3DViewer`
- `About` + النص
- 7 صفوف بيانات بخط تحت كل واحد

---

## كل حاجة جاية من أنهي محاضرة

| الحاجة | المحاضرة |
|---|---|
| `MaterialApp` · `Scaffold` · `ColorScheme.fromSeed` | 1 |
| `Column` · `Row` · `Stack` · `Expanded` · `Align` · `Center` | 1 و 2 |
| `Container` · `Text` · `Icon` · `SizedBox` · `Padding` | 1 |
| `BoxDecoration` · `LinearGradient` · `BorderRadius` · `ClipRRect` | 2 و 5 |
| `Image.asset` · `BoxFit` · تسجيل الأصول | 2 |
| `ElevatedButton.styleFrom` · `shape` · `CircleBorder` | 2 |
| `SingleChildScrollView` | 2 |
| Widgets مخصصة بـ `required` parameters · `final` fields | 3 |
| `StatefulWidget` · `setState` · `dispose` | 3 |
| كلاس ثوابت `static const` | 3 و 4 |
| Collection-if (`if (icon != null)` جوه children) | 4 |
| Named routes · `routeName` · `pushNamed` · `arguments` · `ModalRoute` | 5 |
| `Positioned` جوه `Stack` | 2 |
| `PageController` + `dispose` | 5 (نفس نمط الـ Timer) |

### استثناءات — الـ brief طلبها بالاسم

| الحاجة | الاقتباس |
|---|---|
| `PageView.builder` | "This Component is Page View Which Scroll on Swipe Page By Page" |
| `flutter_3d_controller` | "You Can Use flutter_3d_controller package to handle the 3d objects" |

---

## نقاط تقنية

**الصور اتصغّرت** — الأصول الأصلية كانت 36 ميجا (`sun.png` لوحدها 12.5 ميجا
بمقاس 3208×3260). اتصغّرت لـ 800px كحد أقصى فبقت 5.7 ميجا. صورة بالمقاس
الأصلي ممكن تعمل out-of-memory على موبايل.

**البيانات** — `planets_data.dart` مولّد من `Solar_System_Data.xlsx` مباشرة،
فمفيش احتمال خطأ نسخ في الـ 108 حقل. الرموز زي `10³⁰` محفوظة كما هي.

**الـ PageController** — متعرّف على مستوى كلاس الـ State ومتقفل في `dispose`.
لو مقفلتوش بيسرّب ذاكرة، زي أي controller.

**الأزرار بتحرّك الـ PageView** — `nextPage` و `previousPage` بيستخدموا نفس
الأنيميشن بتاع السحب، فالتجربة واحدة سواء سحبت أو ضغطت.

**تنسيق الأرقام** — `formatNumber` بتشيل `.0` من الأرقام الصحيحة،
فـ `6371.0` بتطلع `6371` بس `23.93` بتفضل زي ما هي.

**`ClipRRect` في الـ AppBar** — الـ `borderRadius` على `BoxDecoration`
بيدوّر الخلفية بس، الصورة بتفضل طالعة من الأركان.

**الـ `viewportFraction: 0.75`** في الـ PageController — بتخلي الكواكب
المجاورة تبان على الجناب، زي الـ Focus Area في التصميم.

---

## ملاحظات على الـ 3D

الـ package بيشتغل عن طريق WebView جواه Google Model Viewer.

**iOS:** ضيف في `ios/Runner/Info.plist`:
```xml
<key>io.flutter.embedded_views_preview</key>
<true/>
```

**Web:** ضيف في `<head>` بتاع `web/index.html`:
```html
<script type="module"
  src="./assets/packages/flutter_3d_controller/assets/model-viewer.min.js"
  defer></script>
```

**Android:** مش محتاج أي إعداد.

ملفات الـ `.glb` حجمها 24 ميجا. لو حجم التطبيق مهم، ممكن تشيل
`solar_system.glb` (مش مستخدم) وتوفّر شوية.

---

## تشيك ليست

**Screen Zero**
- [ ] الصورة مالية الشاشة كلها
- [ ] `Explore The Universe` في النص، 48 bold أبيض
- [ ] زرار `Explore` + سهم تحت
- [ ] الضغط بينقل لـ Home

**Screen One**
- [ ] AppBar بصورة + تدرّج + `Explore` فوق في النص
- [ ] السؤال تحت على الشمال
- [ ] السحب يمين وشمال بيغيّر الكوكب بأنيميشن
- [ ] الزرارين الدائريين بيعملوا نفس الحركة
- [ ] اسم الكوكب في النص بيتحدّث
- [ ] الزرار التحتاني بيقول `Explore {الكوكب}` وبيتحدّث
- [ ] الضغط بينقل للتفاصيل بالكوكب الصح

**Screen Two**
- [ ] AppBar باسم الكوكب فوق والـ title تحت
- [ ] زرار الرجوع شغال
- [ ] الموديل 3D ظاهر وبيتحرّك باللمس
- [ ] قسم About بالنص الكامل
- [ ] السبع صفوف بيانات بالقيم الصح
