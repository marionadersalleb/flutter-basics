# Task Three — Contacts App

تطبيق إدارة جهات اتصال.

## التشغيل

```
flutter pub get
flutter create .
flutter run
```

**شغّله على موبايل أو محاكي** — الـ `image_picker` محتاج معرض صور حقيقي.

---

## الملفات

```
lib/
  main.dart
  common/
    app_colors.dart        #29384D · #FFFFFF · #E2F4F6 · #FFF1D4 · #EE403D
    app_text_styles.dart   Title Large · Title Medium · Body Small · Button
    app_assets.dart        مسارات الأنيميشن واللوجو
  models/
    contact.dart           موديل جهة الاتصال
  screens/
    splash_screen.dart     اللوجو + انتقال تلقائي
    home_screen.dart       الحالة الفاضية + الشبكة + الزرارين
  widgets/
    shared_widgets.dart    RouteLogo + AppElevatedButton + AppTextFormField
    contact_card.dart      كارت الشبكة + المعاينة الحيّة
    add_contact_sheet.dart الـ Bottom Sheet
```

---

## المواصفات من الـ brief

**الألوان:** Dark Blue `#29384D` · White `#FFFFFF` · Light Blue `#E2F4F6`
· Gold `#FFF1D4` · Red `#EE403D`

**النصوص:**
- Title Large — 20 bold ذهبي
- Title Medium — 16 bold ذهبي
- Body Small — 10 regular ذهبي

**الزرار:** خلفية ذهبي، نص أزرق غامق 20 regular، overlay شفاف،
radius 16، padding 16

**حقل النص:** تعبئة أزرق غامق، hint أزرق فاتح 16، نص 16 regular،
radius 16، حدود width 2 ذهبي، حدود خطأ width 2 أحمر، padding 16،
cursor ذهبي

**الشاشة:** خلفية `#29384D`، padding أفقي 16

---

## السلوك المطلوب

| المطلوب | التنفيذ |
|---|---|
| أنيميشن Lottie لما القايمة فاضية | `empty_list.json` + النص تحته |
| الـ FAB بيفتح Bottom Sheet | `showModalBottomSheet` بيرجّع `Contact` |
| زرار بيفتح معرض الصور | أنيميشن `image_picker.json` جوه `InkWell` |
| المعاينة بتتحدّث مع الكتابة | `addListener` على التلات controllers |
| زرار حذف في كل كارت | `onDelete` بيمسح العنصر ده |
| FAB أحمر بيمسح آخر عنصر | ظاهر بس لو القايمة مش فاضية |
| زرار الإضافة يختفي عند 6 | `if (contacts.length < 6)` |

---

## كل حاجة جاية من أنهي محاضرة

| الحاجة | المحاضرة |
|---|---|
| `MaterialApp` · `Scaffold` · `AppBar` · `ColorScheme.fromSeed` | 1 |
| `Column` · `Row` · `Stack` · `Expanded` · `Center` · `Align` | 1 و 2 |
| `Container` · `Text` · `Icon` · `SizedBox` · `Padding` | 1 |
| `BoxDecoration` · `BorderRadius` · `ClipRRect` | 2 و 5 |
| `Image.file` · `BoxFit.cover` | 2 |
| `ElevatedButton.styleFrom` · `shape` · `overlayColor` | 2 |
| `SingleChildScrollView` | 2 |
| `Positioned` جوه `Stack` | 2 |
| Widgets مخصصة بـ `required` parameters · `final` fields | 3 |
| `StatefulWidget` · `setState` · `initState` · `dispose` | 3 |
| كلاس ثوابت `static const` | 3 و 4 |
| Collection-if (`if (contacts.isNotEmpty)` جوه children) | 4 |
| Named routes · `routeName` · `pushReplacementNamed` | 5 |
| `GridView.builder` · `SliverGridDelegateWithFixedCrossAxisCount` | 5 |
| `InkWell` | 5 |
| `Future.delayed` + فحص `mounted` | 5 |

### استثناءات — الـ brief طلبها بالاسم

| الحاجة | الاقتباس |
|---|---|
| `lottie` | "this Animations is Placed Using Lottie Animations Packages" |
| `image_picker` | "You Can Use image_picker package to select image from gallery" |
| `showModalBottomSheet` | "floating Actions Show The Bottom Sheet for Adding One User" |
| `TextFormField` + validator | "Error Border : Width (2) , Color Red" في مواصفات الحقل |

---

## نقاط تقنية

**المعاينة الحيّة** — التلات controllers عليهم `addListener` بينادي
`setState`. علشان كده الكارت فوق بيتحدّث مع كل حرف، زي ما الـ brief
بيقول "on user Change from the text controller".

**`Image.file` مش `Image.asset`** — الصورة جاية من معرض الجهاز مش من
أصول التطبيق، فبتتقرا من نظام الملفات.

**`MediaQuery.of(context).viewInsets.bottom`** — بيرفع الـ Bottom Sheet
فوق الكيبورد. من غيره الحقول بتتخبّى تحته.

**`isScrollControlled: true`** — بيسمح للـ Sheet يعدّي نص الشاشة.
من غيره مش هيكبر كفاية للحقول التلاتة.

**`heroTag`** — لما يكون فيه أكتر من FAB في الشاشة، لازم كل واحد ليه
tag مختلف وإلا Flutter بيطلّع error.

**`dispose` للـ controllers** — التلاتة بيتقفلوا. إهمالها = تسريب ذاكرة.

**`childAspectRatio: 0.62`** — الكارت أطول من عرضه عشان الصورة
والتفاصيل يدخلوا مع بعض.

**فحص `mounted`** — `Future.delayed` في الـ Splash ممكن تخلص بعد ما
المستخدم يكون خرج، والفحص بيمنع الـ crash.

---

## اللوجو

مفيش ملف للوجو Route في الأصول، فمرسوم كنص في `widgets/shared_widgets.dart`.
للاستبدال:

1. صدّر `route_logo.png` في `assets/images/`
2. في `RouteLogo` غيّر `useImageLogo = true`

---

## تشيك ليست

**Splash**
- [ ] لوجو Route في نص شاشة زرقا غامقة
- [ ] بينتقل للـ Home لوحده

**Home فاضية**
- [ ] أنيميشن Lottie شغال
- [ ] "There is No Contacts Added Here" ذهبي
- [ ] FAB ذهبي بعلامة +
- [ ] مفيش FAB أحمر

**Bottom Sheet**
- [ ] أنيميشن image_picker شغال وبيفتح المعرض عند الضغط
- [ ] المعاينة بتتحدّث مع الكتابة
- [ ] التلات حقول بحدود ذهبية
- [ ] إيميل غلط ← حدود حمرا ورسالة
- [ ] زرار "Enter user" ذهبي
- [ ] الكيبورد مش بيخبّي الحقول

**Home ممتلئة**
- [ ] شبكة عمودين
- [ ] كل كارت: صورة + اسم + إيميل + تليفون + زرار Delete أحمر
- [ ] Delete في الكارت بيمسحه هو
- [ ] FAB أحمر بيمسح آخر واحد
- [ ] عند 6 جهات، الـ FAB الذهبي بيختفي
