NADEEM IT KNOWLEDGE BASE V19 - SECURE ONLINE EDITION
======================================================

WHAT IS NEW
- Secure username/password login before any portal page opens.
- Passwords are hashed with Node.js scrypt + a unique salt; plain passwords are not stored.
- Server-side HttpOnly session cookie, SameSite=Lax, 8-hour idle session.
- Login protection: 5 failed attempts per IP within 15 minutes triggers temporary blocking.
- Security headers: CSP, X-Frame-Options DENY, nosniff, no-referrer, restricted permissions.
- Administrator-only User Administration page.
- Admin can create engineer/user accounts, enable/disable accounts and reset passwords.
- OpenAI/API setup pages and API configuration endpoints are administrator-only.
- Ask Agent can be used by authenticated users after API is configured later.
- Portal remains static-content + Node backend and is ready for HTTPS hosting.

FIRST LOCAL RUN
1. Make sure Node.js 18 or newer is installed.
2. Extract this ZIP.
3. Run setup_admin.bat ONCE and create the administrator username/password.
4. Run start_portal.bat.
5. Open http://localhost:3019
6. Sign in.
7. Admins can open Admin from the top-right login badge to create engineer accounts.

ONLINE HOSTING
- Use HTTPS. Do not expose this portal over plain HTTP on the public Internet.
- Set NODE_ENV=production on hosting.
- For first deployment, set secure environment variables:
  ADMIN_USERNAME=<your admin username>
  ADMIN_PASSWORD=<a strong initial password, 10+ characters>
  OPENAI_API_KEY=<add later when Ask Agent integration is finalized>
  OPENAI_MODEL=gpt-5.6-luna
- If users.json does not exist and ADMIN_USERNAME + ADMIN_PASSWORD are present, V19 creates the first admin account automatically.
- Store users.json on persistent storage. If your host uses an ephemeral filesystem, use a persistent disk/database before production use.
- Keep API key on the server only. Never put it inside HTML/JavaScript.

IMPORTANT PRODUCTION NOTE
V19 is secure enough for a personal/small private portal prototype, but for multiple users on a public production site I recommend moving user accounts and sessions to a persistent database (PostgreSQL/SQLite + persistent disk) and putting the site behind HTTPS/reverse proxy or a managed host.
