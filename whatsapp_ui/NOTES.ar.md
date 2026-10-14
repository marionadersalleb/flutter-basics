# Task One — Whatsapp UI

شاشة محادثة واتساب (dark mode) من تصميم Figma.

## التشغيل

```
flutter pub get
flutter create .
flutter run
```

## الملفات

```
lib/
  main.dart          MaterialApp + home
  chat_screen.dart   الشاشة كلها
```

---

## كل حاجة في الكود جاية منين

| الحاجة | المحاضرة |
|---|---|
| `MaterialApp` · `home:` · `Scaffold` · `AppBar` | 1 |
| `Column` · `Row` · `Stack` · `Expanded` | 1 و 2 |
| `Container` · `Text` · `Icon` · `SizedBox` | 1 |
| `Align` · `Alignment(0, 0)` · `MainAxisAlignment.spaceEvenly` | 1 |
| `Padding` · `EdgeInsets.only` · `EdgeInsets.symmetric` | 1 |
| `Color(0xff...)` والشفافية في أول بايتين | 1 |
| `TextStyle` · `FontWeight` | 1 |
| `BoxDecoration` · `BorderRadius.only` · `Radius.zero` | 2 |
| `IconButton` | 2 |
| `SingleChildScrollView` | 2 |

**الاستثناء الوحيد:** `TextFormField` و `InputDecoration` و `OutlineInputBorder`.
متشرحوش في المحاضرات، بس الـ brief طالبهم بالاسم:
"Text Form Field" · "Prefix Icon" · "Suffix Icon" · "Hint Text" ·
"green outline input Border with width 1".

---

## نقاط تقنية

**الركن المربع** — `BorderRadius.only`. الواردة `topLeft: Radius.zero`،
الصادرة `topRight: Radius.zero`، والباقي 16.

**عرض الفقاعة** — `Padding` بـ 70 على الناحية الفاضية، فالفقاعة القصيرة
مبتاخدش عرض الشاشة كله.

**الدوائر** — `Container` مقاس 38 بـ `BorderRadius.circular(19)`،
والمايك مقاس 48 بـ `circular(24)`. نصف القطر = نص المقاس = دايرة.

**حدود حقل النص** — `border` و `enabledBorder` و `focusedBorder` بنفس القيمة.
لو عرّفت واحد بس، الحدود بتبقى زرقا أول ما تضغط على الحقل.

**`Expanded` حوالين `SingleChildScrollView`** — إجباري.
من غيره الـ Column ملهاش ارتفاع محدد والتطبيق بيقع.

**النمط المتكرر** — `Column` من `Row`s فيها `Icon` بلون `0x0AFFFFFF`
(`0x0A` = شفافية عالية)، جوه `Stack` تحت المحادثة.

---

## إضافة صور Figma (اختياري)

في `chat_screen.dart` فيه تعليقين بيقولوا تستبدل إيه:

- **الخلفية** — بدل الـ `Column` بتاعة الأيقونات:
  `Image.asset('assets/images/chat_pattern.png', repeat: ImageRepeat.repeat)`
- **لوجو Route** — بدل الـ `Container` الأبيض:
  `Image.asset('assets/images/route_logo.png')`
- **صورة البروفايل** — بدل `Icon(Icons.person)` في الـ AppBar

وبعدها شيل التعليق عن `assets:` في `pubspec.yaml` ← `flutter pub get`
← **Full Restart** (مش Hot Reload).

---

## تشيك ليست

- [ ] الألوان: `#FFFFFF` / `#168C4B` / `#181818` / `#232D36`
- [ ] AppBar: رجوع + صورة دائرية + اسم أخضر bold 14 + تليفون + فيديو + 3 نقط
- [ ] خلفية `#181818` بنمط متكرر
- [ ] padding أفقي 16 فقط
- [ ] فقاعة واردة: شمال، خضرا، نص 16، `topLeft = 0`
- [ ] فقاعة صادرة: يمين، رمادي، نص 16، `topRight = 0`
- [ ] رسالة فيها صورة
- [ ] حقل نص: حدود خضرا width 1، دائري، hint أبيض 12
- [ ] كاميرا prefix + طيارة ورق suffix
- [ ] زرار مايك دائري أخضر
