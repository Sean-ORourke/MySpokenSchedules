# DEV-4

## How to Run:

1. **Open the zip file.**
2. **Make sure you are in the `my_spoken_schedules` directory in your terminal.**
3. **Open an Android V35 emulator** (probably through Android Studio).
4. **Run the following commands:**
   - `flutter clean`
   - `flutter pub get`
   - `flutter pub upgrade`
   - `flutter run`
5. **Click on the Flutter icon** if the application does not open up in front of you.
6. **Choose to allow notifications.**
7. **Look into the pre-crafted schedules.** Then, create and manage your own! Try setting a task for two minutes (or however long you would like it to be) from now, change the label and message, then do some other fun things in the app, until the notification appears and the message is read out!

## Short Written Report:

### Where did we come from?

MySpokenSchedules! originated as a response to Sean’s hilarious inefficiencies in managing daily alarms and schedules. Thus, Dev Team 14 aimed to create a tool that could streamline notifications and daily schedules. The project started with detailed user personas to guide development: a haphazard college student, a busy professional, and a parent with a hectic schedule. These personas illustrated diverse needs, ranging from schedule organization to personalized alarms and reminders, which laid the foundation for the app’s key tasks.

Initial goals included customizable task sounds, including dynamic voice reminders, playlist playing functionalities, and schedule lists. Schedules were intended to have non-repeating, day-repeating, and other types of repetitions.

Early iterations of the app focused on the visual layout — we only dove into data storage midway through.

### Where did we go?

Throughout development, we managed actual data storage for task creation, editing, and schedule management. Alpha and beta versions of the app showcased clear progress, incorporating feedback to improve user interactions and refine functionalities.

The app’s task system evolved to support label customization, message inputs, and specific time triggers. Schedules allowed users to group tasks, assign them to particular days, and toggle their activation. Notifications were refined to include dynamic AI voice readouts, providing clarity without requiring users to touch their phones.

As the project advanced, key challenges such as emulator compatibility and the limitations of using Flutter on non-Apple devices prompted pivots in design and functionality. Features were tested rigorously through consultant sessions, ensuring they aligned with user needs.

### Why Scaled Down, Changed, or Removed?

Adjustments were necessary to maintain focus and meet deadlines:

- **Spotify API and Sound Features:** Originally envisioned as part of the app’s audio functionality, integrating Spotify proved unfeasible due to the absence of an official API and its complexity. This feature was scaled down to AI-generated voice readouts, which directly addressed the app’s core goal of delivering meaningful notifications.
- **Location-Based Notifications:** This feature was removed to streamline development and focus on time-based triggers, which were deemed more critical by users.
- **Task Photos/Icons:** While users expressed interest in customization options for icons, this feature was deprioritized to avoid scope creep. We did, however, ensure emojis worked in task and schedule creation — including them in the default “New Task” and “New Schedule” — so users could still have visual references for their tasks.

These decisions allowed us to focus on delivering a cohesive experience, emphasizing the essential features to make schedules that are spoken and customizable.

### Lessons Learned?

The development of MySpokenSchedules! highlighted several key lessons:

- **Scope Management:** Focusing on a manageable scope ensured the completion of core features while maintaining quality. The removal of complex functionalities like Spotify integration demonstrated the importance of aligning deliverables with project constraints.
- **User Feedback is Crucial:** User testing sessions revealed unexpected insights, such as the importance of simple visual features (light/dark mode) and intuitive design elements like the Android time selector widget.
- **Technical Readiness:** Early setup of development environments, including compatibility with emulators, is vital for minimizing technical roadblocks. Our team had initially planned to do iOS development — however, realizing that Xcode did not work on non-Mac laptops, and that some laptops struggle to get an emulator up in a timely manner delayed development.
- **Collaboration and Modularity:** Assigning special features, like the AI-voice or Notifications, to particular team members ensured accountability and decreased the amount of research the team had to be familiar with as a whole.

### What is MySpokenSchedules! now?

MySpokenSchedules! is a scheduling tool that provides dynamic voice notifications, customizable task creation, and flexible schedule management. Users can create schedules that align with their routines, set personalized messages for tasks, and receive AI-generated voice reminders at specified times. The app prioritizes a distraction-free experience, allowing users to stay on track without needing to interact directly with their devices.

While some features from the initial vision were scaled back, the app successfully delivers on its core promises, making it a valuable tool for users seeking an intuitive and efficient scheduling solution. It reflects a thoughtful balance between ambitious goals and practical constraints, embodying our commitment to user-centric design and iterative improvement.
