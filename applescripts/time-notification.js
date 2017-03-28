// 実行方法: osascript time-notification.js

const now = new Date();

// https://developer.apple.com/library/content/documentation/LanguagesUtilities/Conceptual/MacAutomationScriptingGuide/DisplayNotifications.html
const app = Application.currentApplication();
app.includeStandardAdditions = true;
app.displayNotification(`${now.getHours()}時${now.getMinutes()}分`, {
  withTitle: '時報',
});
