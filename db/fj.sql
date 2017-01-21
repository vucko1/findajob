-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 21, 2017 at 11:20 AM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fj`
--
CREATE DATABASE IF NOT EXISTS `fj` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `fj`;

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `id` int(11) NOT NULL,
  `name` varchar(155) DEFAULT NULL,
  `place` varchar(155) DEFAULT NULL,
  `orientation` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `noOfEmployees` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`id`, `name`, `place`, `orientation`, `description`, `noOfEmployees`) VALUES
(1, 'Authority Partners1', 'Bosnia And Herzegovina, USA', 'Software Consulting', 'Description za API1', '> 250'),
(2, 'Microsoft BA', 'Bosnia And Herzegovina', 'Hardware, Software, OS, Cloud Computing', 'Description za Microsoft', '100'),
(3, 'Apple', 'Bosnia And Herzegovina, USA', 'Hardware, Software', 'Description za Apple', '> 10k');

-- --------------------------------------------------------

--
-- Table structure for table `job`
--

CREATE TABLE `job` (
  `id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `job`
--

INSERT INTO `job` (`id`, `company_id`, `description`, `title`) VALUES
(2, 1, 'nj-desc', '0');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(30) NOT NULL,
  `firstname` varchar(45) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `dateofbirth` date NOT NULL,
  `gender` int(11) NOT NULL,
  `country` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `profilepicture` longtext,
  `college` varchar(50) DEFAULT NULL,
  `graduationyear` int(11) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `status_id` int(11) NOT NULL,
  `profession` varchar(100) NOT NULL,
  `is_admin` bit(1) NOT NULL,
  `is_company` bit(1) NOT NULL DEFAULT b'0',
  `company_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `firstname`, `lastname`, `dateofbirth`, `gender`, `country`, `city`, `email`, `profilepicture`, `college`, `graduationyear`, `title`, `status_id`, `profession`, `is_admin`, `is_company`, `company_id`) VALUES
(1, 'admin', 'pw', 'Mirza', 'Vucijak', '1995-04-04', 1, 'Bosnia and Herzegovina', 'Sarajevo', 'Mirza.Vucijak@AuthorityPartners.com', 'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/4QhZRXhpZgAATU0AKgAAAAgABwESAAMAAAABAAEAAAEaAAUAAAABAAAAYgEbAAUAAAABAAAAagEoAAMAAAABAAIAAAExAAIAAAAeAAAAcgEyAAIAAAAUAAAAkIdpAAQAAAABAAAApAAAAM4ALcbAAAAnEAAtxsAAACcQQWRvYmUgUGhvdG9zaG9wIENTNS4xIFdpbmRvd3MAMjAxMjowODoyMCAxNTozNjowNAAAA6ABAAMAAAABAAEAAKACAAQAAAABAAABXqADAAQAAAABAAABXgAAAAAACQEAAAMAAAABAFgAAAEBAAMAAAABAFgAAAEDAAMAAAABAAYAAAESAAMAAAABAAEAAAEaAAUAAAABAAABQAEbAAUAAAABAAABSAEoAAMAAAABAAIAAAIBAAQAAAABAAABUAICAAQAAAABAAAHAQAAAAAAAABIAAAAAQAAAEgAAAAB/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQH/2wBDAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQH/wAARCABYAFgDASIAAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQAAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSExBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwDl6KKK/wAbz/qoCiiigAr+kDwD/wAoQ9J/7f8A/wBa4vK/m/r+kDwD/wAoQ9J/7f8A/wBa4vK/QeDP+SV8ef8AtHrxR/8AVfgj/PH9ph/yj/kv/Zxsv/8AWK47Px/ooor/AC2P+fUKKKKACiiigzqdPn+h8f0UUV/oQf8AY4FFFFABX9IHgH/lCHpP/b//AOtcXlfzf1/SB4B/5Qh6T/2//wDrXF5X6DwZ/wAkr48/9o9eKP8A6r8Ef54/tMP+Uf8AJf8As42X/wDrFcdn4/0UUV/lsf8APqFFFFABRRRQZ1Onz/Q+P6K/oS2f8EGfT9f2yf8AGjZ/wQZ9P1/bJ/xr/d7/AIp+/SX/AOiKx/8A4jvH/wD9Bfr/AE9P9xf+Ky/0Hv8Aovqf/iVeEX/00PX+np/PbRX9CWz/AIIM+n6/tk/40bP+CDPp+v7ZP+NH/FP36S//AERWP/8AEd4//wDoL9f6eh/xWX+g9/0X1P8A8Srwi/8Apoev9PT+e2v6QPAP/KEPSf8At/8A/WuLyuR2f8EGfT9f2yf8a/TDwRo37GfiD9jPStJ8GWv2v9kO7+3f2bb+d8VYN/kfFS7ubz97qssPxOXb8Tobp/38q527Yt3h4xqdMb9E3xb8K+CfFfNPETB4HgzIuI/Cfjvg6lxHxPh+JuHuHsqzDN8peJhjs7zjPOG8uweBynA4PLcdjsyxMalevhsDhcRio4WrSoVnT/n36SH07/o+fS/4Fy3wq8EuIJcR8Z4fifCcSPLMPm3BOcVqmW0snzzhxulg+EuL+Js1nUlmvEuU4em3lyoSlXjSddYmrhqFf+X2iv38/wCFPf8ABLb/AKF3/wAq/wC0R/8ALOj/AIU9/wAEtv8AoXf/ACr/ALRH/wAs6/yu/wCJeck/6Sj+iJ/4u3Cf/OQ/hz/iBfip/wBEXxJ/4jnEf/zoPwDor9/P+FPf8Etv+hd/8q/7RH/yzo/4U9/wS2/6F3/yr/tEf/LOj/iXnJP+ko/oif8Ai7cJ/wDOQP8AiBfip/0RfEn/AIjnEf8A86D8A6K/fw/B7/glt/0Lmf8AuL/tEf8Ay0oo/wCJeck/6Sj+iJ/4u3Cf/OQiXgT4qStbgviPT/qneI//AJzn8pdFFFf+gef8qwUUUUAFf1Cfswf8oivA/wD3Mv8A6034gr+Xuv6hP2YP+URXgf8A7mX/ANab8QV/mp+1q/5Qi8W/+yY49/8AXR+JB/p1+yT/AOUtMv8A+yZwn/ry/DY+Y6KKK/8APiP+xYKKKKACiiigD8F6KKK/9Ug/868KKKKACv6hP2YP+URXgf8A7mX/ANab8QV/L3X9Qn7MH/KIrwP/ANzL/wCtN+IK/wA1P2tX/KEXi3/2THHv/ro/Eg/06/ZJ/wDKWmX/APZM4T/15fhsfMdFFFf+fEf9iwUUUUAFFFFAH4L0UUV/6pB/514UUUUAFf1Cfswf8oivA/8A3Mv/AK034goor/NT9rV/yhF4t/8AZMce/wDro/Eg/wBOv2Sf/KWmX/8AZM4T/wBeX4bHzHRRRX/nxH/YsFFFFABRRRQB/9n/2wBDAAMCAgMCAgMDAwMEAwMEBQgFBQQEBQoHBwYIDAoMDAsKCwsNDhIQDQ4RDgsLEBYQERMUFRUVDA8XGBYUGBIUFRT/2wBDAQMEBAUEBQkFBQkUDQsNFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBT/wAARCAFeAV4DASIAAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQAAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSExBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwClRRRX89H9xhRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAHoX7Pv/ACWjwj/1+r/I1+j1fnD+z7/yWjwj/wBfq/yNfo9X6fwp/utT/F+iP548SP8AkYUP8H/tzM3xN/yLmq/9ekv/AKAa/PGv0O8Tf8i5qv8A16S/+gGvzxr8/wDEr+NhfSX5xPw/G7xCiiivxg84KKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooEef0UUV+sH+hIUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQB6F+z7/yWjwj/ANfq/wAjX6PV+cP7Pv8AyWjwj/1+r/I1+j1fp/Cn+61P8X6I/njxI/5GFD/B/wC3MzfE3/Iuar/16S/+gGvzxr9DvE3/ACLmq/8AXpL/AOgGvzxr8/8AEr+NhfSX5xPw/G7xCiiivxg84KKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooEef0UUV+sH+hIUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQB6F+z7/yWjwj/wBfq/yNfo9X5w/s+/8AJaPCP/X6v8jX6PV+n8Kf7rU/xfoj+ePEj/kYUP8AB/7czN8Tf8i5qv8A16S/+gGvzxr9DvE3/Iuar/16S/8AoBr88a/P/Er+NhfSX5xPw/G7xCiiivxg84KKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooEef0UUV+sH+hIUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQB6F+z7/AMlo8I/9fq/yNfo9X5w/s+/8lo8I/wDX6v8AI1+j1fp/Cn+61P8AF+iP548SP+RhQ/wf+3MzfE3/ACLmq/8AXpL/AOgGvzxr9DvE3/Iuar/16S/+gGvzxr8/8Sv42F9JfnE/D8bvEKKKK/GDzgooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigR5/RRRX6wf6EhRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAHoX7Pv/ACWjwj/1+r/I1+j1fnD+z7/yWjwj/wBfq/yNfo9X6fwp/utT/F+iP548SP8AkYUP8H/tzM3xN/yLmq/9ekv/AKAa/PGv0O8Tf8i5qv8A16S/+gGvzxr8/wDEr+NhfSX5xPw/G7xCiiivxg84KKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooEef0UUV+sH+hIUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQB6F+z7/yWjwj/ANfq/wAjX6PV+cP7Pv8AyWjwj/1+r/I1+j1fp/Cn+61P8X6I/njxI/5GFD/B/wC3MzfE3/Iuar/16S/+gGvzxr9DvE3/ACLmq/8AXpL/AOgGvzxr8/8AEr+NhfSX5xPw/G7xCiiivxg84KKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooEef0UUV+sH+hIUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQB6F+z7/yWjwj/wBfq/yNfo9X5w/s+/8AJaPCP/X6v8jX6PV+n8Kf7rU/xfoj+ePEj/kYUP8AB/7czN8Tf8i5qv8A16S/+gGvzxr9DvE3/Iuar/16S/8AoBr88a/P/Er+NhfSX5xPw/G7xCiiivxg84KKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooEef0UUV+sH+hIUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQB6F+z7/AMlo8I/9fq/yNfo9X5w/s+/8lo8I/wDX6v8AI1+j1fp/Cn+61P8AF+iP548SP+RhQ/wf+3MzfE3/ACLmq/8AXpL/AOgGvzxr9DvE3/Iuar/16S/+gGvzxr8/8Sv42F9JfnE/D8bvEKKKK/GDzgooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigR5/RRRX6wf6EhRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAHoX7Pv/ACWjwj/1+r/I1+j1fnD+z7/yWjwj/wBfq/yNfo9X6fwp/utT/F+iP548SP8AkYUP8H/tzM3xN/yLmq/9ekv/AKAa/PGv0O8Tf8i5qv8A16S/+gGvzxr8/wDEr+NhfSX5xPw/G7xCiiivxg84KKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooEef0UUV+sH+hIUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQB6F+z7/yWjwj/ANfq/wAjX6PV+cP7Pv8AyWjwj/1+r/I1+j1fp/Cn+61P8X6I/njxI/5GFD/B/wC3MzfE3/Iuar/16S/+gGvzxr9DvE3/ACLmq/8AXpL/AOgGvzxr8/8AEr+NhfSX5xPw/G7xCiiivxg84KKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooEO/4Z9+Iv/Qo6j/3yP8AGj/hn34i/wDQo6j/AN8j/Gv0eor+pv8AVTC/8/Jfh/kf0F/xEjMP+fEP/Jv8z84f+GffiL/0KOo/98j/ABo/4Z9+Iv8A0KOo/wDfI/xr9HqKP9VML/z8l+H+Qf8AESMw/wCfEP8Ayb/M/OH/AIZ9+Iv/AEKOo/8AfI/xo/4Z9+Iv/Qo6j/3yP8a/R6ij/VTC/wDPyX4f5B/xEjMP+fEP/Jv8z84f+GffiL/0KOo/98j/ABo/4Z9+Iv8A0KOo/wDfI/xr9HqKP9VML/z8l+H+Qf8AESMw/wCfEP8Ayb/M/OH/AIZ9+Iv/AEKOo/8AfI/xo/4Z9+Iv/Qo6j/3yP8a/R6ij/VTC/wDPyX4f5B/xEjMP+fEP/Jv8z84f+GffiL/0KOo/98j/ABo/4Z9+Iv8A0KOo/wDfI/xr9HqKP9VML/z8l+H+Qf8AESMw/wCfEP8Ayb/M/OH/AIZ9+Iv/AEKOo/8AfI/xo/4Z9+Iv/Qo6j/3yP8a/R6ij/VTC/wDPyX4f5B/xEjMP+fEP/Jv8z84f+GffiL/0KOo/98j/ABo/4Z9+Iv8A0KOo/wDfI/xr9HqKP9VML/z8l+H+Qf8AESMw/wCfEP8Ayb/M/OH/AIZ9+Iv/AEKOo/8AfI/xo/4Z9+Iv/Qo6j/3yP8a/R6ij/VTC/wDPyX4f5B/xEjMP+fEP/Jv8z84f+GffiL/0KOo/98j/ABo/4Z9+Iv8A0KOo/wDfI/xr9HqKP9VML/z8l+H+Qf8AESMw/wCfEP8Ayb/M+Fvgt8FvHHh/4qeGtR1Hw1fWljb3YeWeRRtRcHk81900UV9DluW08tpyp05Npu+p8Rnue18/rwr14KLiraX7t9W+5n69DJc6FqMMSl5ZLaRFUdSSpAFfEv8AwpTxz/0LV9/3yP8AGvuqivFz7hnDcQSpyrzlHkva1utu6fY+Sq0Y1bXex8K/8KU8c/8AQtX3/fI/xo/4Up45/wChavv++R/jX3VRXyv/ABDjL/8An9P/AMl/yMPqcO7PhX/hSnjn/oWr7/vkf40f8KU8c/8AQtX3/fI/xr7qoo/4hxl//P6f/kv+QfU4d2fCv/ClPHP/AELV9/3yP8aP+FKeOf8AoWr7/vkf4191UUf8Q4y//n9P/wAl/wAg+pw7s+Ff+FKeOf8AoWr7/vkf40f8KU8c/wDQtX3/AHyP8a+6qKP+IcZf/wA/p/8Akv8AkH1OHdnwr/wpTxz/ANC1ff8AfI/xo/4Up45/6Fq+/wC+R/jX3VRR/wAQ4y//AJ/T/wDJf8g+pw7s+Ff+FKeOf+havv8Avkf40f8AClPHP/QtX3/fI/xr7qoo/wCIcZf/AM/p/wDkv+QfU4d2fCv/AApTxz/0LV9/3yP8aP8AhSnjn/oWr7/vkf4191UUf8Q4y/8A5/T/APJf8g+pw7s+Ff8AhSnjn/oWr7/vkf40f8KU8c/9C1ff98j/ABr7qoo/4hxl/wDz+n/5L/kH1OHdnwr/AMKU8c/9C1ff98j/ABo/4Up45/6Fq+/75H+NfdVFH/EOMv8A+f0//Jf8g+pw7s+Ff+FKeOf+havv++R/jR/wpXxx/wBC1ff98j/Gvuqij/iHGX/8/p/+S/5B9Th3Zk/8JdoX/Qa07/wKj/xo/wCEu0L/AKDWnf8AgVH/AI1+W9Ff1t/qLT/6CH/4D/wT8R/4idW/6BF/4E//AJE/Uj/hLtC/6DWnf+BUf+NH/CXaF/0GtO/8Co/8a/Leij/UWn/0EP8A8B/4If8AETq3/QIv/An/APIn6kf8JdoX/Qa07/wKj/xo/wCEu0L/AKDWnf8AgVH/AI1+W9FH+otP/oIf/gP/AAQ/4idW/wCgRf8AgT/+RP1I/wCEu0L/AKDWnf8AgVH/AI0f8JdoX/Qa07/wKj/xr8t6KP8AUWn/ANBD/wDAf+CH/ETq3/QIv/An/wDIn6kf8JdoX/Qa07/wKj/xo/4S7Qv+g1p3/gVH/jX5b0Uf6i0/+gh/+A/8EP8AiJ1b/oEX/gT/APkT9SP+Eu0L/oNad/4FR/40f8JdoX/Qa07/AMCo/wDGvy3oo/1Fp/8AQQ//AAH/AIIf8ROrf9Ai/wDAn/8AIn6kf8JdoX/Qa07/AMCo/wDGj/hLtC/6DWnf+BUf+NflvRR/qLT/AOgh/wDgP/BD/iJ1b/oEX/gT/wDkT9SP+Eu0L/oNad/4FR/40f8ACXaF/wBBrTv/AAKj/wAa/Leij/UWn/0EP/wH/gh/xE6t/wBAi/8AAn/8ifqR/wAJdoX/AEGtO/8AAqP/ABo/4S7Qv+g1p3/gVH/jX5b0Uf6i0/8AoIf/AID/AMEP+InVv+gRf+BP/wCRP1I/4S7Qv+g1p3/gVH/jR/wl2hf9BrTv/AqP/Gvy3oo/1Fp/9BD/APAf+CH/ABE6t/0CL/wJ/wDyJ+pdv4l0i7nSGDVbKeZzhY47hGZj6AA1p1+cP7Pv/JZ/CP8A1+r/ACav0er4jPcnjk1eFGM+bmV9rdWu7P0rhfiCXEOGqYiVPk5ZWte/RPsu41mCqSSAAOSe1Vf7YsP+f62/7+r/AI0ax/yCL7/rg/8A6Ca+UK/DOMeManC1ShCFBVPaKT1la1reT7n6zk+TxzSM5OfLy26X3+Z9X/2xYf8AP9bf9/V/xo/tiw/5/rb/AL+r/jXyhRX51/xFyv8A9Aa/8Df/AMifQ/6pQ/5/P7v+CfV/9sWH/P8AW3/f1f8AGj+2LD/n+tv+/q/418oUUf8AEXK//QGv/A3/APIh/qlD/n8/u/4J9X/2xYf8/wBbf9/V/wAaP7YsP+f62/7+r/jXyhRR/wARcr/9Aa/8Df8A8iH+qUP+fz+7/gn1f/bFh/z/AFt/39X/ABo/tiw/5/rb/v6v+NfKFFH/ABFyv/0Br/wN/wDyIf6pQ/5/P7v+CfV/9sWH/P8AW3/f1f8AGj+2LD/n+tv+/q/418oUUf8AEXK//QGv/A3/APIh/qlD/n8/u/4J9X/2xYf8/wBbf9/V/wAaP7YsP+f62/7+r/jXyhRR/wARcr/9Aa/8Df8A8iH+qUP+fz+7/gn1f/bFh/z/AFt/39X/ABo/tiw/5/rb/v6v+NfKFFH/ABFyv/0Br/wN/wDyIf6pQ/5/P7v+CfV/9sWH/P8AW3/f1f8AGj+2LD/n+tv+/q/418oUUf8AEXK//QGv/A3/APIh/qlD/n8/u/4J9X/2xYf8/wBbf9/V/wAaP7YsP+f62/7+r/jXyhRR/wARcr/9Aa/8Df8A8iH+qUP+fz+7/gn1f/bFh/z/AFt/39X/ABpP7ZsP+f62/wC/y/418o0Uv+IuV/8AoDX/AIG//kQ/1Sh/z+f3f8E+XKKKK/1BP8zQooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigD0D9n3/ks/hH/AK/V/k1fo9X5w/s+/wDJZ/CP/X6v8mr9Hq/GeOP99pf4f1Z/Rnhp/wAi6v8A4/8A21FPWP8AkEX3/XB//QTXyhX1frH/ACCL7/rg/wD6Ca+UK/iXxc/j4P0n+cT+puE/greq/UKKKK/n0++CiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAPlyiiiv8AcI/yPCiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAPQP2ff+Sz+Ef+v1f5NX6PV+cP7Pv/JZ/CP/AF+r/Jq/R6vxnjj/AH2l/h/Vn9GeGn/Iur/4/wD21FPWP+QRff8AXB//AEE18oV9X6x/yCL7/rg//oJr5Qr+JfFz+Pg/Sf5xP6m4T+Ct6r9Qooor+fT74KKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooA+XKKKK/3CP8jwooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigD0D9n3/AJLP4R/6/V/k1fo9X5w/s+/8ln8I/wDX6v8AJq/R6vxnjj/faX+H9Wf0Z4af8i6v/j/9tRT1j/kEX3/XB/8A0E18oV9X6x/yCL7/AK4P/wCgmvlCv4l8XP4+D9J/nE/qbhP4K3qv1Ciiiv59PvgooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigD5cooor/cI/wAjwooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigD0D9n3/ks/hH/r9X+TV+j1fnD+z7/wAln8I/9fq/yav0er8Z44/32l/h/Vn9GeGn/Iur/wCP/wBtRT1j/kEX3/XB/wD0E18oV9X6x/yCL7/rg/8A6Ca+UK/iXxc/j4P0n+cT+puE/greq/UKKKK/n0++CiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAPlyiiiv9wj/I8KKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooA9A/Z9/5LP4R/wCv1f5NX6PV+cP7Pv8AyWfwj/1+r/Jq/R6vxnjj/faX+H9Wf0Z4af8AIur/AOP/ANtRT1j/AJBF9/1wf/0E18oV9X6x/wAgi+/64P8A+gmvlCv4l8XP4+D9J/nE/qbhP4K3qv1Ciiiv59PvgooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigD5cooor/AHCP8jwooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigD0D9n3/ks/hH/r9X+TV+j1fnD+z7/yWfwj/wBfq/yav0er8Z44/wB9pf4f1Z/Rnhp/yLq/+P8A9tRT1j/kEX3/AFwf/wBBNfKFfV+sf8gi+/64P/6Ca+UK/iXxc/j4P0n+cT+puE/greq/UKKKK/n0++CiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAPlyiiiv9wj/I8KKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooA9A/Z9/wCSz+Ef+v1f5NX6PV+cP7Pv/JZ/CP8A1+r/ACav0er8Z44/32l/h/Vn9GeGn/Iur/4//bUU9Y/5BF9/1wf/ANBNfKFfV+sf8gi+/wCuD/8AoJr5Qr+JfFz+Pg/Sf5xP6m4T+Ct6r9Qooor+fT74KKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooA+XKKKK/3CP8AI8KKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooA9A/Z9/5LP4R/6/V/k1fo9X5w/s+/8AJZ/CP/X6v8mr9Hq/GeOP99pf4f1Z/Rnhp/yLq/8Aj/8AbUU9Y/5BF9/1wf8A9BNfKFfV+sf8gi+/64P/AOgmvlCv4l8XP4+D9J/nE/qbhP4K3qv1Ciiiv59PvgooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigD5cooor/cI/yPCiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAPQP2ff+Sz+Ef8Ar9X+TV+j1fnD+z7/AMln8I/9fq/yav0er8Z44/32l/h/Vn9GeGn/ACLq/wDj/wDbUU9Y/wCQRff9cH/9BNfKFfV+sf8AIIvv+uD/APoJr5Qr+JfFz+Pg/Sf5xP6m4T+Ct6r9Qooor+fT74KKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooA+XKKKK/wBwj/I8KKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooA9A/Z9/5LP4R/6/V/k1fo9X5w/s+/8ln8I/8AX6v8mr9Hq/GeOP8AfaX+H9Wf0Z4af8i6v/j/APbUU9Y/5BF9/wBcH/8AQTXyhX1frH/IIvv+uD/+gmvlCv4l8XP4+D9J/nE/qbhP4K3qv1Ciiiv59PvgooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigD/9k=', 'ETF', 2016, '', 1, 'Software Developer', b'1', b'1', 1),
(2, 'user', 'pw1', 'Ime', 'Prezime', '1995-04-04', 1, 'Bosnia and Herzegovina', 'Sarajevo', 'Ime.Prezime@AuthorityPartners.com', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAKAAAACgCAMAAAC8EZcfAAAAMFBMVEXMzMz////Jycnn5+fZ2dn8/PzPz8/4+PjR0dHu7u7V1dXy8vLX19fg4OD5+fnl5eWGCB1MAAAECElEQVR4nO2cDbbiIAyFa/gtFLr/3Q5YfXYc9QVIwDmHbwPeAyQk5NZlmUwmk8lkMplMJpPJZIF/GK3oTJZjrdvkjc05q5cvEqntFlZvLj9Es4qQRX4DoIMwJip1OaNUNH7fRotbYHG7N39rOy2kX6UeuNHpp+W+vlN34NNWj5KYV898VHfTKFPADJAHWvrPq3fH7G6AQrAiouQllA/dBcL2y+F7XsTeaxgwp++8iMJ1VJhSH3p7f1i3bgqTvsL1OxTaXgKL97ezQqjY35tC3WGXAba69bvkSLH8CsGutfrS5cyfD0GLkvz3jJHMClN5UL3BVwRzoIDzTfoucWdewr1lgzOetYiFxg2+5EhmzTV7q74UJ5xXnmtIMXciZ2GDLwE/YPjqGtsYwjf4cmFlkfCMcDzyGi+RB1zXCRDt8EUxJeuGMuYJwaIvHUGKGM7w3CapzqI5gklgYBHYWic8SE0oi0CqI5juYxaBkkpfak6+XaDnyDNT4BQ4BU6B/5FAnkTtqGoFrquO7i6OPMUCXbllWMqthaolyaMdFoF0FTXTWzDdIWTqSUATPHxkuN5ZQe80e7yyvcBtNF0JTwxfodljxve3QLCEamWcRWjRLjAyJcErENoFes5hDkHzHgPr5Lj9FZ2l0joJ1I1zCM89alraNlkx5sADaHsH5kwxd4Utkez7GBeqkyH7rPMAasc5hjfDnBRuVQpj6GbXq5q6m67uo/IGyvRbvyu6cGzH1Se9BXRR6ZWK6M7eLUj5EJux1Ro6+zCz6VcG8dYa+ixQZItjP4WwaCuTOnyYKCOk7WfDBBvW4vYurqGD6yirAyd8VfcZveC328LiQv0TUgoWXjNr9tWuTRW1YfZV23ZPgAls3qjGUvUkkWmbnSB63DIcpgoASfa+moKFvHCFRZJNszOpdKCVqAPZ8h0o0uILLNXxe2AI7awlrn08kUwh0FjKXigkOoeWbPrwhKLxs7Lpo1HIc/7uEJxDaDbVfqTdZkY2XHpDbHztajf9/oZpakfp3Frv8fWVAzAG8IOWLySoL+A3CmuPIYHrHEftqyHF0AaHqKtsiDzJCOocAkSTTRQVnlYyzzSKmi8kekXIQXG6JrSgoCge0VLaoHCUpZp0h/QWWFYaAm2TiaFwyMhbBb5Cldi5Bixg2RICkT+miKIP7ogcRmUUjOLJvhspwmDvu9Sodw+RjMI28rAMCJGMxwq0QxYwLSH2upOjBOIqhj6t0kuBuPaJ8MugUnCWC9gGZOmDiPLtwagjmA8hRmCr96lF4I5p71z3UvABZoBSaTmhAfN/JUNKrTuYkgvvRGAAY62BPi9Gr1EYgQT/A1APomiFgUGcwngKnAKnwClwCpwC2QV+/V38ZdXMH9jZQEzt+vihAAAAAElFTkSuQmCC', 'ETF', 2016, '', 1, 'Software Developer', b'1', b'0', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_job_favourite`
--

CREATE TABLE `user_job_favourite` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `job_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_job_favourite`
--

INSERT INTO `user_job_favourite` (`id`, `user_id`, `job_id`) VALUES
(7, 1, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job`
--
ALTER TABLE `job`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Jobs_JobCompany_idx` (`company_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_job_favourite`
--
ALTER TABLE `user_job_favourite`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_UserJobOpening_user_id_idx` (`user_id`),
  ADD KEY `FK_UserJobOpening_job_id_idx` (`job_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `job`
--
ALTER TABLE `job`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `user_job_favourite`
--
ALTER TABLE `user_job_favourite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
