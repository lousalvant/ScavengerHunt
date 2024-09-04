# Project 1 - *Scavenger Hunt*

Submitted by: **Lou Salvant - Z23637852**

**Scavenger Hunt** is an app designed to engage users in completing a series of photo-based tasks. Each task in the app has a specific prompt that encourages the user to take a photo that fulfills the task's requirement. The core functionality of the app revolves around attaching photos to these tasks and using location data to show where the photo was taken.

Time spent: **X** hours spent in total

## Required Features

The following **required** functionality is completed:

- [x] App displays list of hard-coded tasks
- [x] When a task is tapped it navigates the user to a task detail view
- [x] When user adds photo to complete the tasks, it marks the task as complete
- [x] When adding photo of task, the location is added
- [x] User returns to home page (list of tasks) and the status of your task is updated to complete
 
The following **optional** features are implemented:

- [x] User can launch camera to snap a picture	

The following **additional** features are implemented:

- [ ] List anything else that you can get done to improve the app functionality!

## Video Walkthrough

Here is a reminder on how to embed Loom videos on GitHub. Feel free to remove this reminder once you upload your README. 

[Guide]](https://www.youtube.com/watch?v=GA92eKlYio4) .

## Notes

While adding the camera feature to the Scavenger Hunt app, I faced challenges in extracting GPS data from camera photos, unlike library photos that have embedded metadata. To solve this, I used Core Location for accurate coordinates and deployed the app on a physical device to test the functionality. Managing user permissions for camera and location access and configuring privacy settings in the app’s Info.plist were also key steps.

## License

    Copyright [2024] [Lou Salvant]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
