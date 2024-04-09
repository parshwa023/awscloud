-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 10, 2023 at 06:50 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `questions_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `password`) VALUES
(1, 'Anonymous', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2'),
(2, 'jayesh', 'f0d2580221200ed5a0a552890386f4d2431f765d'),
(3, 'Jarjish', '9039b35dcba0de97eb3c4be9e32ad7fe1b93cbd0'),
(4, 'Pranav', 'b44b9462564147b36b07a7c5394fe58409624679'),
(5, 'Harshal', 'ab54d425fa8ac654e8cdf0307eebcc33ea46d08e'),
(9, 'jd', 'ff9dedefe9ee78b3339d23163d8b29a3c83c6016');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(100) NOT NULL,
  `post_id` int(100) NOT NULL,
  `admin_id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `comment` varchar(1000) NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `post_id`, `admin_id`, `user_id`, `user_name`, `comment`, `date`) VALUES
(19, 15, 2, 12, 'Jarjish', 'yes', '2023-03-30'),
(20, 15, 2, 9, 'Pranav', 'cool', '2023-03-30'),
(21, 14, 2, 10, 'Harshal', 'sure', '2023-03-30');

-- --------------------------------------------------------

--
-- Table structure for table `downvotes`
--

CREATE TABLE `downvotes` (
  `id` int(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  `admin_id` int(100) NOT NULL,
  `post_id` int(100) NOT NULL,
  `comment_id` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `downvotes`
--

INSERT INTO `downvotes` (`id`, `user_id`, `admin_id`, `post_id`, `comment_id`) VALUES
(28, 10, 2, 20, 20),
(29, 9, 2, 19, 19);

-- --------------------------------------------------------

--
-- Table structure for table `leaderboard`
--

CREATE TABLE `leaderboard` (
  `id` int(100) NOT NULL,
  `user_id` int(255) NOT NULL,
  `post_id` int(255) NOT NULL,
  `admin_id` int(255) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `upvotes_id` int(255) DEFAULT NULL,
  `downvotes_id` int(255) DEFAULT NULL,
  `comment_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `leaderboard`
--

INSERT INTO `leaderboard` (`id`, `user_id`, `post_id`, `admin_id`, `user_name`, `upvotes_id`, `downvotes_id`, `comment_id`) VALUES
(8, 8, 19, 2, 'Jarjish', 19, NULL, 19),
(9, 10, 19, 2, 'Jarjish', 19, NULL, 19),
(10, 10, 20, 2, 'Pranav', NULL, 20, 20),
(11, 8, 21, 2, 'Harshal', 21, NULL, 21),
(13, 12, 21, 2, 'Harshal', 21, NULL, 21),
(18, 9, 19, 2, 'Jarjish', NULL, 19, 19);

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `admin_id` int(100) NOT NULL,
  `post_id` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`id`, `user_id`, `admin_id`, `post_id`) VALUES
(14, 8, 2, 5);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(100) NOT NULL,
  `admin_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` varchar(10000) NOT NULL,
  `category` varchar(50) NOT NULL,
  `image` varchar(100) NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp(),
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `admin_id`, `name`, `title`, `content`, `category`, `image`, `date`, `status`) VALUES
(5, 2, 'jayesh', 'Related to java', 'Solve the query in image', 'Java', 'img1.jpeg', '2023-03-25', 'active'),
(6, 5, 'Harshal', 'dsada', 'dvsdsv', 'Frontend', 'question1.jpg', '2023-03-26', 'active'),
(7, 5, 'Harshal', 'Shortcut key to add quotes in pandas list ', 'I have copied some of the names from a website and kept it in a list:\r\n\r\nlst = [Steve\r\n       Joseph\r\n       John\r\n       Aaron\r\n       Lisa\r\n       ]\r\nBut this is not a correct list format of strings so I want to make it like this:\r\n\r\nlst = [&#39;Steve&#39;,\r\n       &#39;Joseph&#39;,\r\n       &#39;John&#39;,\r\n       &#39;Aaron&#39;,\r\n       &#39;Lisa&#39;\r\n       ]\r\nIs there any shortcut key to achieve it or I have to do it manually ?? There are totally 167 names so doing it manually is a time taking process that&#39;s why I was asking', 'Python', '', '2023-03-28', 'active'),
(8, 3, 'Jarjish', 'Tips on updating a large scale E5 library', 'I&#39;m working with a large client that has a huge and powerful ES5 library, which I&#39;m evaluating the effort to update it to modern ES6. Wondering if anyone has done this in the past without a full re-write of everything, or if there&#39;s any sort of automated tooling to help along the way.\r\n\r\nHere are some details:\r\n\r\nThe library is broken up into about a few hundred files.\r\nIt uses a custom definition of classes, and a custom implementation of inheritance.\r\nLots of dependence on the global (window) namespace. There isn&#39;t a clear mapping of dependencies.\r\nLots of use of static classes.\r\nNothing is loaded async. All of this library is loaded upfront.\r\nMy main goals of doing this are:\r\n\r\nTo make the library more portable with more modern frameworks.\r\nTo setup proper treeshaking.\r\nTo take advantage of proper codesplitting.\r\nAny thoughts, approches, or details of your experiences are greatly appreciated!', 'Javascript', '', '2023-03-28', 'active'),
(9, 3, 'Jarjish', 'Extension doesnt start with vs code', '0\r\n\r\n\r\nI&#39;m working on a VS extension that consist of a toolbar, a toolwindow and a settings page. The whole extension more or less works, but only after loading a solution. As the toolbar contains short-cuts to external applications, it would be favourable to be able to launch those applications already before loading the solution. The main package I set-up as follows:\r\n\r\n    [PackageRegistration(UseManagedResourcesOnly = true, AllowsBackgroundLoading = true)]\r\n    [InstalledProductRegistration(&#34;#110&#34;, &#34;#112&#34;, &#34;1.0&#34;, IconResourceID = 400)]\r\n    [ProvideMenuResource(&#34;Menus.ctmenu&#34;, 1)]\r\n    [ProvideToolWindow(typeof(MyBarToolWindow))]\r\n    [ProvideOptionPage(typeof(UserSettingsPage), &#34;My Toolbar&#34;, &#34;Settings&#34;, 0, 0, true)]\r\n    [ProvideProfileAttribute(typeof(UserSettingsPage), &#34;MyBar (new)&#34;, &#34;General&#34;, 1002, 1003, true)]\r\n    [Guid(GroupsGuids.guidMyBarUIPkgString)]\r\n    [ProvideAutoLoad(UIContextGuids80.NoSolution, PackageAutoLoadFlags.BackgroundLoad)]\r\n    public sealed class MyBar_UIPackage : AsyncPackage, IDteServiceProvider\r\n    {\r\n        private IMyBarSettings settings;\r\n\r\n        // .....\r\n\r\n        /// \r\n        /// Called when the VSPackage is loaded by Visual Studio.\r\n        /// \r\n        protected override async Task InitializeAsync(CancellationToken cancellationToken, IProgress progress)\r\n        {\r\n            // Switches to the UI thread in order to consume some services used in command initialization\r\n            await this.JoinableTaskFactory.SwitchToMainThreadAsync(cancellationToken);\r\n\r\n            await base.InitializeAsync(cancellationToken, progress);\r\n            this.GetDte().Events.DTEEvents.OnStartupComplete += this.OnStartupCompleted;\r\n            this.GetDte().Events.SolutionEvents.Opened += this.OnInitialize;\r\n            this.GetDte().Events.WindowEvents.WindowActivated += this.OnWindowEventsWindowActivated;\r\n\r\n            // Query service asynchronously from the UI thread\r\n            var dte = GetService(typeof(EnvDTE.DTE)) as EnvDTE.DTE;\r\n        }\r\n    }\r\nSomehow Opened WindowActivated and OnStartupComplete don&#39;t fire during startup of Visual Studio, but only while loading a solution. Why is that and how can I force the extension to be started with VS?\r\n\r\nEDIT: just found out, if I close VS with the toolwindow open, it gets reopened upon next start-up and with that, the extension starts as well. If VS starts up without the toolwindow open, I can&#39;t even open the toolwindow because the extension is not yet started-up (hence: loading a solution is necessary).', 'C#', '', '2023-03-28', 'active'),
(10, 3, 'Jarjish', 'Android Kotlin accessibility', 'I have a RecyclerView and its layoutmanager is a type of GridLayoutManager. And I use Accessibility in my application. My layoutmanager&#39;s span count is 3. So I have items with 3 columns and they are scrollable.\r\n\r\nMy problem is only on Amazon tablet. Assume that you are focused 1st row&#39;s 2nd item(middle item of row), and you are scrolling the screen. Focus is still in same item in few seconds, then it jumps to another view of my screen.\r\n\r\nWhat I want is; when I focus on any item, then if I scroll, then if I dont see my first item, I want to shift my focus to first visible row&#39;s first item.\r\n\r\nSo the scenario is: focus 1st row&#39;s middle item, scroll the screen, if I dont see my focused item then focus will jump to 2nd row&#39;s first item, scroll the screen, if I dont see my focused item then focus will jump to 3rd row&#39;s first item\r\n\r\nWhat I tried is:\r\n\r\nbinding.myRecyclerView.addOnScrollListener(object : RecyclerView.OnScrollListener() {\r\n            override fun onScrolled(recyclerView: RecyclerView, dx: Int, dy: Int) {\r\n                super.onScrolled(recyclerView, dx, dy)\r\n                val layoutManager = recyclerView.layoutManager as GridLayoutManager\r\n                val firstVisibleItemPosition = layoutManager.findFirstVisibleItemPosition()\r\n                recyclerView.layoutManager?.findViewByPosition(firstVisibleItemPosition)?.let {\r\n                    ViewCompat.setAccessibilityDelegate(it, object : AccessibilityDelegateCompat() {\r\n                        override fun onInitializeAccessibilityNodeInfo(host: View, info: AccessibilityNodeInfoCompat) {\r\n                            super.onInitializeAccessibilityNodeInfo(host, info)\r\n                            host.performAccessibilityAction(AccessibilityNodeInfo.ACTION_ACCESSIBILITY_FOCUS, null)\r\n                            host.sendAccessibilityEvent(AccessibilityEvent.TYPE_VIEW_FOCUSED)\r\n                        }\r\n                    })\r\n                }\r\n            }\r\n        })\r\nBut the result is, I can&#39;t focus any item with tapping. Always stays on first item. If I scroll to down, it jumps to first item of new row (which is good) but when I scroll up, focus is changing between these 2 items.\r\n\r\nWhat am I missing? Can you help me?', 'Android Development', '', '2023-03-28', 'active'),
(11, 4, 'Pranav', 'PHP - trait', 'How to handle a generic trait which gets added to a trait but it also used in a class so the class has access to that trait as well.\r\n\r\nThe example will throw a\r\n\r\nTrait method parseError has not been applied, because there are collisions with other trait methods\r\n\r\nFor example\r\n\r\ntrait error {\r\n  function parseError(){\r\n  }\r\n}\r\n\r\ntrait api {\r\n  use error;\r\n  function callAPI(){\r\n    $this->parseError();\r\n  }\r\n}\r\n\r\nclass makeAPICall{\r\n  use api, error\r\n\r\n  function addABook($title){\r\n    $this->callAPI();\r\n  }\r\n\r\n  function validateBook(){\r\n    $this->parseError();\r\n  }\r\n}', 'PHP', '', '2023-03-28', 'active'),
(12, 4, 'Pranav', 'Changing html output', 'i&#39;m quite new to js and i know i&#39;m taking something difficult on. the tl;dr would be that i&#39;m trying to make a simple GUI to learn js better and what i&#39;m looking for it&#39;s a bit of guidance\r\n\r\nso i have this code\r\n\r\n`\r\n\r\nName: {nameSource}\r\nClass: {charClassSource}\r\nLevel: {levelSource}\r\nPrimary Attribute: {primaryAttributeSource}  \r\nSecondary Attribute: {secondaryAttributeSource}  \r\n{AttributeItem1}  {AttributeItem1Source}  \r\n{AttributeItem2}  {AttributeItem2Source}  \r\n{AttributeItem3}  {AttributeItem2Source}  \r\nNow what i need to know not to bother too much is that depending on the Primary At and Secondary the Source would change. For example if you have 10 Strength + 5 from items your Primary Attribute would be 15. The others doesn&#39;t really matter right know I&#39;d only need some help with the basic ones.\r\n\r\n`\r\n\r\nNothing that I tried too much since I am a bit new to js. Probably I&#39;d try to target the dl class=&#34;padl&#34; to replace the content with the sum of the let strength = &#34;15&#34; for eg but since i am new i don&#39;t know exactly how to', 'Frontend', '', '2023-03-28', 'active'),
(13, 4, 'Pranav', 'Temporary files in c++', 'Here is a trivial example of it being used:\r\n\r\nstd::string file = std::tmpnam(nullptr);\r\n\r\nboost::process::child c(boost::process::search_path(&#34;tar&#34;), { &#34;-czf&#34;, file, ... } );\r\nc.wait();\r\n\r\nSendArchive(file); // opens, reads, and closes file\r\n\r\nstd::filesystem::remove(file);\r\nHowever g++ issues a warning:\r\n\r\nwarning: the use of &#39;tmpnam&#39; is dangerous, better use &#39;mkstemp&#39;\r\n\r\nWhat can I use as an alternative?\r\n\r\nmkstemp is posix-specific\r\nstd::tempfile only returns a file-descriptor. I can&#39;t pass that to tar, and prefer to not manually read /proc/self/fd/ to get the name.\r\nboost::unique_path is possible, but then I&#39;m starting to mix std::filesystem and boost::filesystem which I&#39;m worried I&#39;ll regret later.\r\nI&#39;m tempted to use std::filesystem::temp_directory_path and then add my own randomly generated characters to it.', 'C++', '', '2023-03-28', 'active'),
(14, 2, 'jayesh', 'How can i use r shiny to create buttons', 'I am trying to produce an app front end using R Shiny with buttons that I can use to run code in mySQL. The purpose is to make this easier to run for people without a coding background.\r\n\r\nI know how to write normal R code to link to SQL...\r\n\r\ndatabase ', 'Backend', '', '2023-03-28', 'active'),
(15, 2, 'jayesh', 'Apache Hadoop vs Google Bigdata', 'Can any one explain me the key difference between Apache Hadoop vs Google Bigdata\r\nWhich one is better(hadoop or google big data).', 'BigData', '', '2023-03-28', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `upvotes`
--

CREATE TABLE `upvotes` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `admin_id` int(100) NOT NULL,
  `post_id` int(100) NOT NULL,
  `comment_id` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `upvotes`
--

INSERT INTO `upvotes` (`id`, `user_id`, `admin_id`, `post_id`, `comment_id`) VALUES
(76, 8, 2, 19, 19),
(77, 10, 2, 19, 19),
(78, 8, 2, 21, 21),
(80, 12, 2, 21, 21);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`) VALUES
(8, 'Jayesh', 'jayesh@gmail.com', 'f0d2580221200ed5a0a552890386f4d2431f765d'),
(9, 'Pranav', 'pranav@gmail.com', 'b44b9462564147b36b07a7c5394fe58409624679'),
(10, 'Harshal', 'harshal@gmail.com', 'ab54d425fa8ac654e8cdf0307eebcc33ea46d08e'),
(11, 'takatak', 'tuktuk@gmail.com', '65f8eceaf8f1f03badb316b4774a4f8d8c3183a4'),
(12, 'Jarjish', 'jarjish@gmail.com', '9039b35dcba0de97eb3c4be9e32ad7fe1b93cbd0');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `downvotes`
--
ALTER TABLE `downvotes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leaderboard`
--
ALTER TABLE `leaderboard`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `upvotes`
--
ALTER TABLE `upvotes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `downvotes`
--
ALTER TABLE `downvotes`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `leaderboard`
--
ALTER TABLE `leaderboard`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `upvotes`
--
ALTER TABLE `upvotes`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
