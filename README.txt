# زاد الشريعة والقانون — الإصدار 3

## المزايا
- واجهة عامة للطلاب.
- بحث وتصنيف.
- لوحة إدارة محمية بتسجيل الدخول.
- إضافة وتعديل وحذف الملخصات.
- إضافة وتعديل وحذف الأقسام.
- رفع PDF والصور إلى Storage.
- نشر/عرض الملفات للطلاب.
- تصميم متجاوب للهاتف.

## إعداد مجاني
1. أنشئ مشروعًا في Supabase.
2. افتح SQL Editor وشغّل `database.sql`.
3. من Storage أنشئ Bucket باسم `materials` واجعله Public.
4. أنشئ حساب المدير من Authentication > Users.
5. افتح `config.js` وضع Project URL و anon public key.
6. اختبر `index.html` و `admin.html`.
7. ارفع الملفات إلى GitHub Pages أو Netlify أو Cloudflare Pages.

## ملاحظة أمنية مهمة
لا تضع `service_role` key داخل الموقع. النسخة تستخدم anon key + Supabase Auth + Row Level Security.
