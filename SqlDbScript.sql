CREATE DATABASE your_database_name
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    Name VARCHAR(225),
    Username VARCHAR(225),
    Email VARCHAR(225),
    Role VARCHAR(225),
    Password VARCHAR(225) 
);

CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    Title VARCHAR(225),
    Description VARCHAR(225),
    Email VARCHAR(225),
    CreatedAt DateTime,
    UserID INT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE Assessment (
    AssessmentID INT PRIMARY KEY,
    Title VARCHAR(225),
    ContentUrl VARCHAR(225),
    CourseID INT,
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

CREATE TABLE Enrollment (
    EnrollmentID INT PRIMARY KEY,
    UserID INT,
    CourseID INT,
    EnrollmentDateTime DateTime,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

CREATE TABLE Content (
    ContentID INT PRIMARY KEY,
    Title VARCHAR(225),
    Type VARCHAR(225),
    CourseID INT,
    ContentUrl VARCHAR(225),
    UserID INT,
    CreatedAt DateTime,
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE UserProgress (
    ProgressID INT PRIMARY KEY,
    UserID INT,
    LessonID INT,
    CompletedAt DateTime,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (LessonID) REFERENCES Lesson(LessonID)
);

CREATE TABLE Submission (
    SubmissionID INT PRIMARY KEY,
    UserID INT,
    AssessmentID INT,
    SubmissionDateTime DateTime,
    Score DOUBLE,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (AssessmentID) REFERENCES Assessment(AssessmentID)
);

CREATE TABLE Recommendation (
    RecommendationID INT PRIMARY KEY,
    RecommendationDateTime DateTime,
    UserID INT,
    CourseID INT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

CREATE TABLE Lesson (
    LessonID INT PRIMARY KEY,
    Title VARCHAR(225),
    Description VARCHAR(225),
    ContentUrl VARCHAR(225),
    CourseID INT,
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

CREATE TABLE DiscussionForum (
    ForumID INT PRIMARY KEY,
    Title VARCHAR(225),
    Message VARCHAR(225),
    CreatedAt DateTime,
    UserID INT,
    CourseID INT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

CREATE TABLE Announcement (
    AnnouncementID INT PRIMARY KEY,
    Title VARCHAR(225),
    Content VARCHAR(225),
    CreatedAt DateTime,
    UserID INT,
    CourseID INT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);
