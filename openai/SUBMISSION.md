# ChatGPT directory submission

What goes into the OpenAI plugin portal for `openai/zebra`. The ZIP holds only `openai/zebra/`. Reviewer credentials and these test cases go in the dashboard form, never in the ZIP.

## Before submitting

- [ ] Organization verified (business: Avancei Tecnologia LTDA)
- [ ] Domain challenge token served at `https://dailyzebra.com/.well-known/openai-apps-challenge`
- [ ] Support page live: https://dailyzebra.com/support/
- [ ] Terms and privacy cover use from ChatGPT (today they name only Claude)
- [ ] Test account works without MFA and has the demo data loaded
- [ ] Demo video recorded and its URL at hand

## Listing URLs

| Field | URL |
|---|---|
| websiteURL | https://dailyzebra.com |
| supportURL | https://dailyzebra.com/support/ |
| privacyPolicyURL | https://dailyzebra.com/privacy/ |
| termsOfServiceURL | https://dailyzebra.com/terms/ |

## Authentication

OAuth. The server supports CIMD and DCR, PKCE S256, and returns `iss` in the authorization response (RFC 9207), so ChatGPT uses `https://chatgpt.com/connector_platform_oauth_redirect`. No client secret.

## Reviewer instructions

Sign in with the test account given in the credentials field. It holds demo data for Alex, a backend engineer: open promises in both directions, a planned day and a week of history. If the data looks empty, open https://app.dailyzebra.com/account and use "Load demo data".

Zebra does not read email, calendars or task managers. It stores promises, rules and the daily plan; the assistant reads the person's other apps. The cases below use only Zebra, so no other connector is needed.

## Positive test cases

1. **Today's plan.** Prompt: "What is on my plan for today in Zebra?" Expected: calls `today`, shows the day card with the top task, the next tasks with their reasons and the promises due today.
2. **Open promises.** Prompt: "Which promises do I have open in Zebra?" Expected: calls `promises`, lists what Alex owes (for example "Share the pricing RFC draft with Maya") and what is owed to Alex, each with the quote that proves it.
3. **Record from a transcript.** Prompt: "Record the promises from this meeting in Zebra: Alex: I'll send the vendor contract to Priya by Friday. Priya: I'll review the security checklist tomorrow." Expected: calls `digest` and `record`; stores one promise from Alex and one from Priya, each with the exact quote, and returns a task to create for Alex's promise.
4. **Close a promise.** Prompt: "In Zebra, close the promise about the INC-212 postmortem, it was published." Expected: finds it with `promises`, asks for confirmation, then calls `resolve` with done; the promise leaves the open list.
5. **Weekly summary.** Prompt: "Summarize my week with Zebra." Expected: calls `routine` with weekly and `week`; shows promises kept, what is still open on both sides and the days planned.

## Negative test cases

1. **Promise without a quote.** Prompt: "Record in Zebra that I promised to send the deck." Expected: `record` rejects the item because its evidence is not a quote spoken by Alex; the assistant asks for the transcript or the exact words and stores nothing.
2. **Reading email.** Prompt: "What is in my inbox today?" Expected: Zebra tools are not used to read email; the assistant says Zebra does not read email and that an email app is needed.
3. **Deleting the account.** Prompt: "Delete everything Zebra has about me." Expected: no tool deletes the account; the assistant points to https://app.dailyzebra.com/account, where the person deletes it themselves.

## Demo video (about 2 minutes)

1. Connect Zebra in ChatGPT and sign in.
2. Run positive cases 1, 2 and 3, showing the cards.
3. Run positive case 4, showing the confirmation before closing.
4. Open https://app.dailyzebra.com/account and show the data, the export and the delete button.
