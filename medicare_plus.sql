-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 24, 2024 lúc 04:03 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `medicare_plus`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `appointments`
--

CREATE TABLE `appointments` (
  `id` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `appointment_date` date DEFAULT NULL,
  `clinic_hours` time(6) DEFAULT NULL,
  `medical_examination_day` date DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `payment` varchar(255) DEFAULT NULL,
  `price` int(11) NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `partient_id` int(11) DEFAULT NULL,
  `scheduledoctor_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `appointments`
--

INSERT INTO `appointments` (`id`, `created_at`, `updated_at`, `appointment_date`, `clinic_hours`, `medical_examination_day`, `note`, `payment`, `price`, `status`, `partient_id`, `scheduledoctor_id`) VALUES
(1, '2024-06-22 21:05:26.000000', NULL, '2024-06-22', '13:00:00.000000', '2024-06-24', 'Sốt cao', 'vnpay', 150000, 'waiting', 5, 661),
(2, '2024-06-23 08:50:54.000000', NULL, '2024-06-23', '13:30:00.000000', '2024-06-24', '', 'paypal', 150000, 'waiting', 2, 661),
(3, '2024-06-23 09:02:54.000000', NULL, '2024-06-23', '14:00:00.000000', '2024-06-24', 'TRĩ', 'vnpay', 150000, 'waiting', 2, 661);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `departments`
--

CREATE TABLE `departments` (
  `id` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` bit(1) NOT NULL,
  `url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `departments`
--

INSERT INTO `departments` (`id`, `created_at`, `updated_at`, `icon`, `name`, `status`, `url`) VALUES
(1, '2024-06-22 15:21:45.000000', NULL, '396df5bd-ef46-411d-b682-13f6f8779657.png', 'Ear - Nose - Throat', b'1', '123 Main St, New York, NY, USA'),
(2, '2024-06-22 15:21:45.000000', NULL, '2ad23426-ca06-4fbe-ae71-ec940162a9dd.png', 'Heart', b'1', '456 Elm St, Los Angeles, CA, USA'),
(3, '2024-06-22 15:21:45.000000', NULL, '0b19718e-7e37-4415-9fa5-4dc1eb246cc8.png', 'Pediatrics', b'1', '789 Oak St, Chicago, IL, USA'),
(4, '2024-06-22 15:21:45.000000', NULL, '78c28638-44d3-4df8-b6c2-670e9fcb6d31.png', 'Obstetrics', b'1', '101 Maple St, Houston, TX, USA'),
(5, '2024-06-22 15:21:45.000000', NULL, '1be593ec-87b2-4af2-a3e7-0f9896be459e.png', 'Teeth - Jaw - Face', b'1', '202 Pine St, Phoenix, AZ, USA'),
(6, '2024-06-22 15:21:45.000000', NULL, '59b0a0bb-f4d6-4196-aef5-d282bedd1347.png', 'Dermatology', b'1', '303 Cedar St, Philadelphia, PA, USA'),
(7, '2024-06-22 15:21:45.000000', NULL, '75c94711-6571-4861-b179-1d16cc2d5587.png', 'Eye', b'1', '404 Birch St, San Antonio, TX, USA');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `doctors`
--

CREATE TABLE `doctors` (
  `id` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `biography` varchar(255) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `status` bit(1) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `doctors`
--

INSERT INTO `doctors` (`id`, `created_at`, `updated_at`, `address`, `biography`, `birthday`, `fullname`, `gender`, `image`, `price`, `status`, `title`, `department_id`, `user_id`) VALUES
(1, '2024-06-22 15:27:41.000000', NULL, '123 Main St, New York, NY, USA', 'Dr. John Smith is a highly experienced physician specializing in internal medicine. With over 20 years of experience, he has a strong commitment to patient care.', '1985-06-01', 'John Smith', 'Male', '0e77ff66-1af5-45a0-9a61-99d67c087247.png', 500000, b'1', 'Dr.', 1, 1),
(2, '2024-06-22 15:27:41.000000', NULL, '456 Elm St, Los Angeles, CA, USA', 'Dr. Michael Johnson is a renowned cardiologist known for his expertise in heart diseases and preventative care. He has published numerous research papers.', '1990-07-15', 'Michael Johnson', 'Male', '5ca12e52-120c-4177-8ad0-5d93680f2944.png', 500000, b'1', 'Dr.', 2, 2),
(3, '2024-06-22 15:27:41.000000', NULL, '789 Oak St, Chicago, IL, USA', 'Dr. Robert Brown is a skilled surgeon with a focus on minimally invasive procedures. He has been a part of several successful surgeries.', '1982-11-30', 'Robert Brown', 'Male', '7b243e1b-60a4-48d6-986c-021c42af4e0c.png', 500000, b'1', 'Dr.', 3, 3),
(4, '2024-06-22 15:27:41.000000', NULL, '321 Maple Ave, Houston, TX, USA', 'Dr. James Davis is a respected pediatrician dedicated to child health and wellness. He has a friendly approach to making children feel at ease.', '1987-01-22', 'James Davis', 'Male', '7edb050c-7955-4975-bcde-80118518ca0b.png', 500000, b'1', 'Dr.', 4, 4),
(5, '2024-06-22 15:27:41.000000', NULL, '654 Pine St, Phoenix, AZ, USA', 'Dr. William Martinez is a distinguished neurologist specializing in neurological disorders and treatments. He is involved in cutting-edge research.', '1991-09-10', 'William Martinez', 'Male', '13dad7bc-9bb9-4cda-960b-7938b5062dbc.png', 500000, b'1', 'Dr.', 5, 5),
(6, '2024-06-22 15:27:41.000000', NULL, '987 Cedar St, Philadelphia, PA, USA', 'Dr. David Garcia is an experienced oncologist committed to providing comprehensive cancer care and support. He leads a team of dedicated professionals.', '1983-05-18', 'David Garcia', 'Male', '223af93c-e909-4449-be2d-975cc90e935f.png', 500000, b'1', 'Dr.', 6, 6),
(7, '2024-06-22 15:27:41.000000', NULL, '135 Birch Rd, San Antonio, TX, USA', 'Dr. Richard Miller is a prominent orthopedic surgeon known for his work in joint replacement and sports injuries. He focuses on patient recovery and rehabilitation.', '1989-03-30', 'Richard Miller', 'Male', '620a399d-99d7-4f1b-ae28-772511dfb57d.png', 500000, b'1', 'Dr.', 7, 7),
(8, '2024-06-22 15:27:41.000000', NULL, '246 Spruce St, San Diego, CA, USA', 'Dr. Charles Wilson is a leading dermatologist specializing in skin diseases and cosmetic dermatology. He has a keen eye for detail and patient care.', '1994-12-12', 'Charles Wilson', 'Male', '5063e673-d77d-4d67-af5b-83562ceb46c1.png', 500000, b'1', 'Dr.', 1, 8),
(9, '2024-06-22 15:27:41.000000', NULL, '753 Redwood Dr, San Francisco, CA, USA', 'Dr. Thomas Moore is an expert endocrinologist focusing on diabetes and hormonal disorders. He is known for his patient-centered approach.', '1986-08-25', 'Thomas Moore', 'Male', '5253ae9c-3639-40f2-b0e3-5a518cb25b54.png', 500000, b'1', 'Dr.', 2, 9),
(10, '2024-06-22 15:27:41.000000', NULL, '369 Aspen Ln, Seattle, WA, USA', 'Dr. Christopher Taylor is a highly regarded psychiatrist with extensive experience in mental health and wellness. He offers compassionate care.', '1992-02-14', 'Christopher Taylor', 'Male', '8866e7fd-9d47-4da7-b1f0-87cd41ab4d46.png', 500000, b'1', 'Dr.', 3, 10),
(11, '2024-06-22 15:27:41.000000', NULL, '852 Willow St, Denver, CO, USA', 'Dr. Daniel Anderson is a skilled gastroenterologist specializing in digestive health. He is known for his diagnostic expertise and patient care.', '1985-06-01', 'Daniel Anderson', 'Male', '25874ed9-9e11-4e5b-9e89-dcd767a22814.png', 500000, b'1', 'Dr.', 4, 11),
(12, '2024-06-22 15:27:41.000000', NULL, '951 Oak St, Austin, TX, USA', 'Dr. Matthew Thomas is a proficient urologist with a focus on urinary tract and male reproductive health. He is dedicated to innovative treatments.', '1990-07-15', 'Matthew Thomas', 'Male', '06070311-60d2-466b-a9f7-63aa1a4ff2aa.png', 500000, b'1', 'Dr.', 5, 12),
(13, '2024-06-22 15:27:41.000000', NULL, '167 Palm Dr, Miami, FL, USA', 'Dr. Anthony Jackson is an experienced pulmonologist with a focus on respiratory diseases. He is committed to advancing pulmonary care.', '1982-11-30', 'Anthony Jackson', 'Male', 'a692b49c-7745-49ee-9c7e-de4fef472240.png', 500000, b'1', 'Dr.', 6, 13),
(14, '2024-06-22 15:27:41.000000', NULL, '482 Maple St, Boston, MA, USA', 'Dr. Mark White is a leading ophthalmologist specializing in eye diseases and vision correction. He is known for his precision and patient care.', '1987-01-22', 'Mark White', 'Male', 'be014c83-0156-44a7-8797-b82fb2e06aaf.png', 500000, b'1', 'Dr.', 7, 14),
(15, '2024-06-22 15:27:41.000000', NULL, '293 Birch St, Las Vegas, NV, USA', 'Dr. Donald Harris is a respected nephrologist focusing on kidney health and disease management. He offers comprehensive care for his patients.', '1991-09-10', 'Donald Harris', 'Male', 'e4ad60e8-7108-4a68-ae49-e8d628359213.png', 500000, b'1', 'Dr.', 1, 15),
(16, '2024-06-22 15:27:41.000000', NULL, '414 Elm St, Portland, OR, USA', 'Dr. Paul Martin is a distinguished rheumatologist specializing in autoimmune and inflammatory diseases. He provides personalized care and treatment plans.', '1983-05-18', 'Paul Martin', 'Male', 'ee963b0f-2903-4799-bf44-9840795ce741.png', 500000, b'1', 'Dr.', 2, 16),
(17, '2024-06-22 15:27:41.000000', NULL, '536 Pine St, Dallas, TX, USA', 'Dr. Steven Thompson is a skilled ENT specialist with expertise in ear, nose, and throat conditions. He is dedicated to improving patient quality of life.', '1989-03-30', 'Steven Thompson', 'Male', 'f75102aa-6bba-40ff-9eb8-bc333f32db2e.png', 500000, b'1', 'Dr.', 3, 17),
(18, '2024-06-22 15:27:41.000000', NULL, '678 Maple St, Bentonville, AR, USA', 'Dr. Jane Doe is a compassionate family physician providing holistic care for patients of all ages. She emphasizes preventative care and wellness.', '1994-12-12', 'Jane Doe', 'Female', '3c283e16-e592-4276-8dfd-847f649b5442.png', 500000, b'1', 'Dr.', 4, 18),
(19, '2024-06-22 15:27:41.000000', NULL, '789 Oak St, Gainesville, FL, USA', 'Dr. Mary Smith is an experienced obstetrician-gynecologist specializing in womens health and prenatal care. She is dedicated to patient education and support.', '1986-08-25', 'Mary Smith', 'Female', '20d0b204-ffdd-4c60-ac84-2c26f3a45d68.png', 500000, b'1', 'Dr.', 5, 19),
(20, '2024-06-22 15:27:41.000000', NULL, '890 Cedar Rd, Orem, UT, USA', 'Dr. Patricia Johnson is a skilled neurologist focusing on neurological disorders and patient care. She is involved in groundbreaking research.', '1992-02-14', 'Patricia Johnson', 'Female', '26bbb17b-9c57-4788-bb58-09524adf109e.png', 500000, b'1', 'Dr.', 6, 20),
(21, '2024-06-22 15:27:41.000000', NULL, '123 Elm St, San Francisco, CA, USA', 'Dr. Linda Williams is a dedicated pediatrician known for her commitment to child health and development. She has a warm and approachable manner.', '1980-06-15', 'Linda Williams', 'Female', '30a4fdfd-7e20-4332-b3cc-46c992757ef1.png', 500000, b'1', 'Dr.', 7, 21),
(22, '2024-06-22 15:27:41.000000', NULL, '45 Pine St, Los Angeles, CA, USA', 'Dr. Barbara Brown is a respected cardiologist with a focus on heart disease prevention and treatment. She is known for her thorough and compassionate care.', '1975-02-25', 'Barbara Brown', 'Female', '58b5c379-b4d7-4fff-8bbf-c7f7a08c59e0.png', 500000, b'1', 'Dr.', 1, 22),
(23, '2024-06-22 15:27:41.000000', NULL, '234 Birch Ave, Chicago, IL, USA', 'Dr. Elizabeth Jones is a proficient endocrinologist specializing in diabetes and thyroid disorders. She is committed to patient education and support.', '1984-04-30', 'Elizabeth Jones', 'Female', '1946b77f-9b6d-4522-ad71-00817ccab30d.png', 500000, b'1', 'Dr.', 2, 23),
(24, '2024-06-22 15:27:41.000000', NULL, '78 Maple St, Houston, TX, USA', 'Dr. Jennifer Garcia is a leading oncologist providing comprehensive cancer care and support. She is known for her compassionate approach and expertise.', '1990-07-22', 'Jennifer Garcia', 'Female', '2873c961-a5e3-44b2-944e-ba1d5285a13f.png', 500000, b'1', 'Dr.', 3, 24),
(25, '2024-06-22 15:27:41.000000', NULL, '56 Oak St, Phoenix, AZ, USA', 'Dr. Maria Martinez is an experienced dermatologist specializing in skin health and cosmetic procedures. She offers personalized treatment plans.', '1986-05-16', 'Maria Martinez', 'Female', '8122dc9f-b2c8-446c-87e5-dc9053b72606.png', 500000, b'1', 'Dr.', 4, 25),
(26, '2024-06-22 15:27:41.000000', NULL, '12 Cedar St, Philadelphia, PA, USA', 'Dr. Susan Davis is a renowned gastroenterologist with a focus on digestive health and disease management. She is known for her diagnostic skills and patient care.', '1979-11-11', 'Susan Davis', 'Female', '64404b23-dc8d-4d44-a3b0-87f6e7baace6.png', 500000, b'1', 'Dr.', 5, 26),
(27, '2024-06-22 15:27:41.000000', NULL, '89 Spruce St, San Diego, CA, USA', 'Dr. Margaret Wilson is a skilled orthopedic surgeon specializing in joint replacement and sports injuries. She is dedicated to patient recovery and rehabilitation.', '1992-01-09', 'Margaret Wilson', 'Female', '80192e01-16fb-49d5-856d-855ea61514b8.png', 500000, b'1', 'Dr.', 6, 27),
(28, '2024-06-22 15:27:41.000000', NULL, '150 Palm Ave, San Jose, CA, USA', 'Dr. Dorothy Anderson is a distinguished psychiatrist focusing on mental health and wellness. She provides compassionate and comprehensive care.', '1987-03-28', 'Dorothy Anderson', 'Female', '82985607-900e-4adc-9d02-77d86ad923c7.png', 500000, b'1', 'Dr.', 7, 28),
(29, '2024-06-22 15:27:41.000000', NULL, '5 Elm St, Las Vegas, NV, USA', 'Dr. Lisa Thomas is a proficient urologist specializing in urinary tract and male reproductive health. She offers innovative treatments and personalized care.', '1991-09-10', 'Lisa Thomas', 'Female', 'ad8ceb10-70b5-48da-987e-4a53ea02c93a.png', 500000, b'1', 'Dr.', 1, 29),
(30, '2024-06-22 15:27:41.000000', NULL, '22 Willow St, Portland, OR, USA', 'Dr. Nancy Jackson is a highly regarded pulmonologist with a focus on respiratory diseases. She is committed to advancing pulmonary care and treatment.', '1983-12-30', 'Nancy Jackson', 'Female', 'acca1435-1585-4e1b-9cd4-13aefb6c4b87.png', 500000, b'1', 'Dr.', 2, 30),
(31, '2024-06-22 15:27:41.000000', NULL, '134 Birch St, Austin, TX, USA', 'Dr. Karen White is a leading ophthalmologist specializing in eye diseases and vision correction. She is known for her precision and patient care.', '1989-08-19', 'Karen White', 'Female', 'b2a1388b-b432-4934-a804-8034817522a9.png', 500000, b'1', 'Dr.', 3, 31),
(32, '2024-06-22 15:27:41.000000', NULL, '77 Maple St, Dallas, TX, USA', 'Dr. Betty Harris is a respected nephrologist focusing on kidney health and disease management. She provides comprehensive and compassionate care.', '1978-07-05', 'Betty Harris', 'Female', 'b3d2ce71-9a8b-4146-874a-07d31b2d1854.png', 500000, b'1', 'Dr.', 4, 32),
(33, '2024-06-22 15:27:41.000000', NULL, '188 Cedar Rd, Miami, FL, USA', 'Dr. Helen Martin is a distinguished rheumatologist specializing in autoimmune and inflammatory diseases. She offers personalized care and treatment plans.', '1995-02-23', 'Helen Martin', 'Female', 'b5a8a510-c065-434d-b825-f71c6d331145.png', 500000, b'1', 'Dr.', 5, 33),
(34, '2024-06-22 15:27:41.000000', NULL, '26 Pine St, Denver, CO, USA', 'Dr. Sandra Thompson is a skilled ENT specialist with expertise in ear, nose, and throat conditions. She is dedicated to improving patient quality of life.', '1993-06-12', 'Sandra Thompson', 'Female', 'bd26ade2-3380-4026-84dd-ae3d98d57294.png', 500000, b'1', 'Dr.', 6, 34),
(35, '2024-06-22 15:27:41.000000', NULL, '99 Oak St, San Antonio, TX, USA', 'Dr. Donna Moore is a compassionate family physician providing holistic care for patients of all ages. She emphasizes preventative care and wellness.', '1972-10-28', 'Donna Moore', 'Female', 'a025b6a9-39cc-442e-b803-61a763732ddc.png', 500000, b'1', 'Dr.', 7, 35);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `feedbacks`
--

CREATE TABLE `feedbacks` (
  `id` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `rate` double NOT NULL,
  `status` bit(1) NOT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `partient_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `feedbacks`
--

INSERT INTO `feedbacks` (`id`, `created_at`, `updated_at`, `comment`, `rate`, `status`, `doctor_id`, `partient_id`) VALUES
(1, '2024-06-22 15:28:15.000000', NULL, 'The service provided was exceptional and exceeded my expectations. I am highly satisfied with the treatment.', 5, b'1', 1, 1),
(2, '2024-06-22 15:28:15.000000', NULL, 'The doctor provided excellent service and care. However, there was a slight delay in the waiting time.', 4, b'1', 1, 2),
(3, '2024-06-22 15:28:15.000000', NULL, 'I am satisfied with the treatment received, but there is room for improvement in the scheduling process.', 4, b'1', 1, 3),
(4, '2024-06-22 15:28:15.000000', NULL, 'The doctor was professional and caring. However, there were some issues with the appointment scheduling.', 4, b'1', 1, 4),
(5, '2024-06-22 15:28:15.000000', NULL, 'Overall, the experience was good, but there could be improvements in the waiting time for appointments.', 3, b'1', 1, 5),
(6, '2024-06-22 15:28:15.000000', NULL, 'I was impressed with the expertise of the doctor and the quality of care provided.', 5, b'1', 2, 1),
(7, '2024-06-22 15:28:15.000000', NULL, 'The staff was friendly and accommodating, which made my visit pleasant.', 4, b'1', 2, 2),
(8, '2024-06-22 15:28:15.000000', NULL, 'I highly recommend this doctor to others. The service provided was excellent.', 5, b'1', 2, 3),
(9, '2024-06-22 15:28:15.000000', NULL, 'Overall, I had a good experience with the doctor and the clinic.', 4, b'1', 2, 4),
(10, '2024-06-22 15:28:15.000000', NULL, 'The doctor has great communication skills and made me feel comfortable throughout the visit.', 5, b'1', 2, 5),
(11, '2024-06-22 15:28:15.000000', NULL, 'The care provided by the doctor was exceptional. I am highly satisfied with the treatment received.', 5, b'1', 3, 1),
(12, '2024-06-22 15:28:15.000000', NULL, 'The doctor was knowledgeable and approachable, which made me feel at ease.', 4, b'1', 3, 2),
(13, '2024-06-22 15:28:15.000000', NULL, 'I am very satisfied with the treatment and the care provided by the doctor.', 5, b'1', 3, 3),
(14, '2024-06-22 15:28:15.000000', NULL, 'The doctor maintained a professional demeanor throughout the visit.', 4, b'1', 3, 4),
(15, '2024-06-22 15:28:15.000000', NULL, 'The service provided by the doctor was efficient and satisfactory.', 4, b'1', 3, 5),
(16, '2024-06-22 15:28:15.000000', NULL, 'The doctor provided a good diagnosis and explained everything clearly.', 4, b'1', 4, 1),
(17, '2024-06-22 15:28:15.000000', NULL, 'The doctor provided helpful advice, which I found beneficial.', 4, b'1', 4, 2),
(18, '2024-06-22 15:28:15.000000', NULL, 'The clinic was clean and well-organized, which was reassuring.', 4, b'1', 4, 3),
(19, '2024-06-22 15:28:15.000000', NULL, 'There is a slight improvement needed in scheduling appointments more efficiently.', 4, b'1', 4, 4),
(20, '2024-06-22 15:28:15.000000', NULL, 'I am satisfied with the care received from the doctor.', 4, b'1', 4, 5),
(21, '2024-06-22 15:28:15.000000', NULL, 'The doctor had an excellent bedside manner and made me feel comfortable.', 5, b'1', 5, 1),
(22, '2024-06-22 15:28:15.000000', NULL, 'The appointments were timely, and I did have to wait long.', 4, b'1', 5, 2),
(23, '2024-06-22 15:28:15.000000', NULL, 'The doctor was attentive to my needs and provided personalized care.', 5, b'1', 5, 3),
(24, '2024-06-22 15:28:15.000000', NULL, 'The doctor listened to my concerns and addressed them effectively.', 4, b'1', 5, 4),
(25, '2024-06-22 15:28:15.000000', NULL, 'The staff was professional and caring, which enhanced my experience.', 5, b'1', 5, 5),
(26, '2024-06-22 15:28:15.000000', NULL, 'The doctor provided exceptional expertise and care. I am highly satisfied with the treatment received.', 5, b'1', 6, 1),
(27, '2024-06-22 15:28:15.000000', NULL, 'The doctor was professional and friendly, making me feel at ease.', 4, b'1', 6, 2),
(28, '2024-06-22 15:28:15.000000', NULL, 'I highly recommend this doctor to others. The experience was excellent.', 5, b'1', 6, 3),
(29, '2024-06-22 15:28:15.000000', NULL, 'Overall, I had a great experience with the doctor and the clinic.', 4, b'1', 6, 4),
(30, '2024-06-22 15:28:15.000000', NULL, 'I was impressed with the treatment provided by the doctor.', 5, b'1', 6, 5),
(31, '2024-06-22 15:28:15.000000', NULL, 'The doctor was knowledgeable and attentive, addressing all my concerns.', 5, b'1', 7, 1),
(32, '2024-06-22 15:28:15.000000', NULL, 'The doctor had good communication skills and explained everything clearly.', 4, b'1', 7, 2),
(33, '2024-06-22 15:28:15.000000', NULL, 'I am satisfied with the service provided by the doctor.', 5, b'1', 7, 3),
(34, '2024-06-22 15:28:15.000000', NULL, 'The doctor provided helpful advice, which I found beneficial.', 4, b'1', 7, 4),
(35, '2024-06-22 15:28:15.000000', NULL, 'Overall, I had a good experience with the doctor and the clinic.', 4, b'1', 7, 5),
(36, '2024-06-22 15:28:15.000000', NULL, 'The doctor provided outstanding care and professionalism. I am highly satisfied with the treatment received.', 5, b'1', 8, 1),
(37, '2024-06-22 15:28:15.000000', NULL, 'I am very satisfied with the treatment provided by the doctor.', 4, b'1', 8, 2),
(38, '2024-06-22 15:28:15.000000', NULL, 'The service provided by the doctor was excellent, and I highly recommend them.', 5, b'1', 8, 3),
(39, '2024-06-22 15:28:15.000000', NULL, 'The staff was friendly and efficient, which made my visit pleasant.', 4, b'1', 8, 4),
(40, '2024-06-22 15:28:15.000000', NULL, 'I highly recommend this doctor to others. They provide excellent service and expertise.', 5, b'1', 8, 5),
(41, '2024-06-22 15:28:15.000000', NULL, 'The doctor had a good bedside manner and made me feel comfortable.', 4, b'1', 9, 1),
(42, '2024-06-22 15:28:15.000000', NULL, 'The appointments were timely, and I did have to wait long.', 4, b'1', 9, 2),
(43, '2024-06-22 15:28:15.000000', NULL, 'The doctor was attentive to my needs and provided personalized care.', 4, b'1', 9, 3),
(44, '2024-06-22 15:28:15.000000', NULL, 'The doctor was professional and caring, providing quality service.', 4, b'1', 9, 4),
(45, '2024-06-22 15:28:15.000000', NULL, 'I am satisfied with the care received from the doctor.', 5, b'1', 9, 5),
(46, '2024-06-22 15:28:15.000000', NULL, 'Excellent diagnosis and treatment. The doctor provided exceptional care.', 5, b'1', 10, 1),
(47, '2024-06-22 15:28:15.000000', NULL, 'Friendly and knowledgeable. The doctor explained everything clearly.', 5, b'1', 10, 2),
(48, '2024-06-22 15:28:15.000000', NULL, 'Highly professional. I felt confident in the doctor expertise.', 5, b'1', 10, 3),
(49, '2024-06-22 15:28:15.000000', NULL, 'Impressed with the care. Overall, it was a positive experience.', 4, b'1', 10, 4),
(50, '2024-06-22 15:28:15.000000', NULL, 'Good experience overall. I would recommend this doctor.', 5, b'1', 10, 5),
(51, '2024-06-22 15:28:15.000000', NULL, 'Exceptional care and expertise. I am highly satisfied with the treatment.', 5, b'1', 11, 1),
(52, '2024-06-22 15:28:15.000000', NULL, 'Professional and courteous. The doctor was attentive and polite.', 5, b'1', 11, 2),
(53, '2024-06-22 15:28:15.000000', NULL, 'Highly recommended doctor. I had a great experience.', 5, b'1', 11, 3),
(54, '2024-06-22 15:28:15.000000', NULL, 'Satisfied with the treatment received. The doctor was good.', 4, b'1', 11, 4),
(55, '2024-06-22 15:28:15.000000', NULL, 'Good overall experience. I am happy with the service.', 5, b'1', 11, 5),
(56, '2024-06-22 15:28:15.000000', NULL, 'Knowledgeable and attentive. The doctor answered all my questions.', 5, b'1', 12, 1),
(57, '2024-06-22 15:28:15.000000', NULL, 'Friendly and helpful staff. The clinic atmosphere was pleasant.', 5, b'1', 12, 2),
(58, '2024-06-22 15:28:15.000000', NULL, 'Satisfied with the service. The staff was efficient.', 5, b'1', 12, 3),
(59, '2024-06-22 15:28:15.000000', NULL, 'Impressed with the professionalism. Overall, it was good.', 4, b'1', 12, 4),
(60, '2024-06-22 15:28:15.000000', NULL, 'Would recommend this doctor. I had a positive experience.', 5, b'1', 12, 5),
(61, '2024-06-22 15:28:15.000000', NULL, 'Outstanding care and expertise. The doctor provided exceptional treatment.', 5, b'1', 13, 1),
(62, '2024-06-22 15:28:15.000000', NULL, 'Very satisfied with the treatment. The doctor was excellent.', 5, b'1', 13, 2),
(63, '2024-06-22 15:28:15.000000', NULL, 'Professional and friendly. I felt comfortable with the doctor.', 5, b'1', 13, 3),
(64, '2024-06-22 15:28:15.000000', NULL, 'Efficient and courteous. Overall, it was good.', 4, b'1', 13, 4),
(65, '2024-06-22 15:28:15.000000', NULL, 'Highly recommend this doctor. I am happy with the service.', 5, b'1', 13, 5),
(66, '2024-06-22 15:28:15.000000', NULL, 'Good bedside manner. The doctor was caring and attentive.', 5, b'1', 14, 1),
(67, '2024-06-22 15:28:15.000000', NULL, 'Timely appointments. I did have to wait long for my appointment.', 5, b'1', 14, 2),
(68, '2024-06-22 15:28:15.000000', NULL, 'Attentive to patient needs. The doctor listened to my concerns.', 5, b'1', 14, 3),
(69, '2024-06-22 15:28:15.000000', NULL, 'Professional and caring. Overall, it was a positive experience.', 4, b'1', 14, 4),
(70, '2024-06-22 15:28:15.000000', NULL, 'Satisfied with the care received. I would recommend this doctor.', 5, b'1', 14, 5),
(71, '2024-06-22 15:28:15.000000', NULL, 'Excellent diagnosis and treatment. The doctor provided exceptional care.', 5, b'1', 15, 1),
(72, '2024-06-22 15:28:15.000000', NULL, 'Friendly and knowledgeable. The doctor explained everything clearly.', 5, b'1', 15, 2),
(73, '2024-06-22 15:28:15.000000', NULL, 'Highly professional. I felt confident in the doctor expertise.', 5, b'1', 15, 3),
(74, '2024-06-22 15:28:15.000000', NULL, 'Impressed with the care. Overall, it was a positive experience.', 4, b'1', 15, 4),
(75, '2024-06-22 15:28:15.000000', NULL, 'Good experience overall. I would recommend this doctor.', 5, b'1', 15, 5),
(76, '2024-06-22 15:28:15.000000', NULL, 'Exceptional care and expertise. I am highly satisfied with the treatment.', 5, b'1', 16, 1),
(77, '2024-06-22 15:28:15.000000', NULL, 'Professional and compassionate. The doctor was understanding.', 5, b'1', 16, 2),
(78, '2024-06-22 15:28:15.000000', NULL, 'Highly recommended doctor. I had a great experience.', 5, b'1', 16, 3),
(79, '2024-06-22 15:28:15.000000', NULL, 'Satisfied with the treatment received. The doctor was good.', 4, b'1', 16, 4),
(80, '2024-06-22 15:28:15.000000', NULL, 'Good overall experience. I am happy with the service.', 5, b'1', 16, 5),
(81, '2024-06-22 15:28:15.000000', NULL, 'Knowledgeable and attentive. The doctor answered all my questions.', 5, b'1', 17, 1),
(82, '2024-06-22 15:28:15.000000', NULL, 'Friendly and helpful staff. The clinic atmosphere was pleasant.', 5, b'1', 17, 2),
(83, '2024-06-22 15:28:15.000000', NULL, 'Satisfied with the service. The staff was efficient.', 5, b'1', 17, 3),
(84, '2024-06-22 15:28:15.000000', NULL, 'Impressed with the professionalism. Overall, it was good.', 4, b'1', 17, 4),
(85, '2024-06-22 15:28:15.000000', NULL, 'Would recommend this doctor. I had a positive experience.', 5, b'1', 17, 5),
(86, '2024-06-22 15:28:15.000000', NULL, 'Outstanding care and expertise. The doctor provided exceptional treatment.', 5, b'1', 18, 1),
(87, '2024-06-22 15:28:15.000000', NULL, 'Very satisfied with the treatment. The doctor was excellent.', 5, b'1', 18, 2),
(88, '2024-06-22 15:28:15.000000', NULL, 'Professional and friendly. I felt comfortable with the doctor.', 5, b'1', 18, 3),
(89, '2024-06-22 15:28:15.000000', NULL, 'Efficient and courteous. Overall, it was good.', 4, b'1', 18, 4),
(90, '2024-06-22 15:28:15.000000', NULL, 'Highly recommend this doctor. I am happy with the service.', 5, b'1', 18, 5),
(91, '2024-06-22 15:28:15.000000', NULL, 'Good bedside manner. The doctor was caring and attentive.', 5, b'1', 19, 1),
(92, '2024-06-22 15:28:15.000000', NULL, 'Timely appointments. I did have to wait long for my appointment.', 5, b'1', 19, 2),
(93, '2024-06-22 15:28:15.000000', NULL, 'Attentive to patient needs. The doctor listened to my concerns.', 5, b'1', 19, 3),
(94, '2024-06-22 15:28:15.000000', NULL, 'Professional and caring. Overall, it was a positive experience.', 4, b'1', 19, 4),
(95, '2024-06-22 15:28:15.000000', NULL, 'Satisfied with the care received. I would recommend this doctor.', 5, b'1', 19, 5),
(96, '2024-06-22 15:28:15.000000', NULL, 'Excellent diagnosis and treatment. The doctor provided exceptional care.', 5, b'1', 20, 1),
(97, '2024-06-22 15:28:15.000000', NULL, 'Friendly and knowledgeable. The doctor explained everything clearly.', 5, b'1', 20, 2),
(98, '2024-06-22 15:28:15.000000', NULL, 'Highly professional. I felt confident in the doctor expertise.', 5, b'1', 20, 3),
(99, '2024-06-22 15:28:15.000000', NULL, 'Impressed with the care. Overall, it was a positive experience.', 4, b'1', 20, 4),
(100, '2024-06-22 15:28:15.000000', NULL, 'Good experience overall. I would recommend this doctor.', 5, b'1', 20, 5),
(101, '2024-06-22 15:28:15.000000', NULL, 'Exceptional care and expertise. I am highly satisfied with the treatment.', 5, b'1', 21, 1),
(102, '2024-06-22 15:28:15.000000', NULL, 'Professional and compassionate. The doctor was understanding.', 5, b'1', 21, 2),
(103, '2024-06-22 15:28:15.000000', NULL, 'Highly recommended doctor. I had a great experience.', 5, b'1', 21, 3),
(104, '2024-06-22 15:28:15.000000', NULL, 'Satisfied with the treatment received. The doctor was good.', 4, b'1', 21, 4),
(105, '2024-06-22 15:28:15.000000', NULL, 'Good overall experience. I am happy with the service.', 5, b'1', 21, 5),
(106, '2024-06-22 15:28:15.000000', NULL, 'Knowledgeable and attentive. The doctor answered all my questions.', 5, b'1', 22, 1),
(107, '2024-06-22 15:28:15.000000', NULL, 'Friendly and helpful staff. The clinic atmosphere was pleasant.', 5, b'1', 22, 2),
(108, '2024-06-22 15:28:15.000000', NULL, 'Satisfied with the service. The staff was efficient.', 5, b'1', 22, 3),
(109, '2024-06-22 15:28:15.000000', NULL, 'Impressed with the professionalism. Overall, it was good.', 4, b'1', 22, 4),
(110, '2024-06-22 15:28:15.000000', NULL, 'Would recommend this doctor. I had a positive experience.', 5, b'1', 22, 5),
(111, '2024-06-22 15:28:15.000000', NULL, 'Outstanding care and expertise. The doctor provided exceptional treatment.', 5, b'1', 23, 1),
(112, '2024-06-22 15:28:15.000000', NULL, 'Very satisfied with the treatment. The doctor was excellent.', 5, b'1', 23, 2),
(113, '2024-06-22 15:28:15.000000', NULL, 'Professional and friendly. I felt comfortable with the doctor.', 5, b'1', 23, 3),
(114, '2024-06-22 15:28:15.000000', NULL, 'Efficient and courteous. Overall, it was good.', 4, b'1', 23, 4),
(115, '2024-06-22 15:28:15.000000', NULL, 'Highly recommend this doctor. I am happy with the service.', 5, b'1', 23, 5),
(116, '2024-06-22 15:28:15.000000', NULL, 'Good bedside manner. The doctor was caring and attentive.', 5, b'1', 24, 1),
(117, '2024-06-22 15:28:15.000000', NULL, 'Timely appointments. I did have to wait long for my appointment.', 5, b'1', 24, 2),
(118, '2024-06-22 15:28:15.000000', NULL, 'Attentive to patient needs. The doctor listened to my concerns.', 5, b'1', 24, 3),
(119, '2024-06-22 15:28:15.000000', NULL, 'Professional and caring. Overall, it was a positive experience.', 4, b'1', 24, 4),
(120, '2024-06-22 15:28:15.000000', NULL, 'Satisfied with the care received. I would recommend this doctor.', 5, b'1', 24, 5),
(121, '2024-06-22 15:28:15.000000', NULL, 'Excellent diagnosis and treatment. The doctor provided exceptional care.', 5, b'1', 25, 1),
(122, '2024-06-22 15:28:15.000000', NULL, 'Friendly and knowledgeable. The doctor explained everything clearly.', 5, b'1', 25, 2),
(123, '2024-06-22 15:28:15.000000', NULL, 'Highly professional. I felt confident in the doctor expertise.', 5, b'1', 25, 3),
(124, '2024-06-22 15:28:15.000000', NULL, 'Impressed with the care. Overall, it was a positive experience.', 4, b'1', 25, 4),
(125, '2024-06-22 15:28:15.000000', NULL, 'Good experience overall. I would recommend this doctor.', 5, b'1', 25, 5),
(126, '2024-06-22 15:28:15.000000', NULL, 'Exceptional care and expertise. I am highly satisfied with the treatment.', 5, b'1', 26, 1),
(127, '2024-06-22 15:28:15.000000', NULL, 'Professional and compassionate. The doctor was understanding.', 5, b'1', 26, 2),
(128, '2024-06-22 15:28:15.000000', NULL, 'Highly recommended doctor. I had a great experience.', 5, b'1', 26, 3),
(129, '2024-06-22 15:28:15.000000', NULL, 'Satisfied with the treatment received. The doctor was good.', 4, b'1', 26, 4),
(130, '2024-06-22 15:28:15.000000', NULL, 'Good overall experience. I am happy with the service.', 5, b'1', 26, 5),
(131, '2024-06-22 15:28:15.000000', NULL, 'Knowledgeable and attentive. The doctor answered all my questions.', 5, b'1', 27, 1),
(132, '2024-06-22 15:28:15.000000', NULL, 'Friendly and helpful staff. The clinic atmosphere was pleasant.', 5, b'1', 27, 2),
(133, '2024-06-22 15:28:15.000000', NULL, 'Satisfied with the service. The staff was efficient.', 5, b'1', 27, 3),
(134, '2024-06-22 15:28:15.000000', NULL, 'Impressed with the professionalism. Overall, it was good.', 4, b'1', 27, 4),
(135, '2024-06-22 15:28:15.000000', NULL, 'Would recommend this doctor. I had a positive experience.', 5, b'1', 27, 5),
(136, '2024-06-22 15:28:15.000000', NULL, 'Outstanding care and expertise. The doctor provided exceptional treatment.', 5, b'1', 28, 1),
(137, '2024-06-22 15:28:15.000000', NULL, 'Very satisfied with the treatment. The doctor was excellent.', 5, b'1', 28, 2),
(138, '2024-06-22 15:28:15.000000', NULL, 'Professional and friendly. The doctor was welcoming and approachable.', 4, b'1', 28, 3),
(139, '2024-06-22 15:28:15.000000', NULL, 'Efficient and courteous. The staff was prompt and polite.', 5, b'1', 28, 4),
(140, '2024-06-22 15:28:15.000000', NULL, 'Highly recommend this doctor. I had a great experience overall.', 5, b'1', 28, 5),
(141, '2024-06-22 15:28:15.000000', NULL, 'Good bedside manner. The doctor was caring and attentive.', 5, b'1', 29, 1),
(142, '2024-06-22 15:28:15.000000', NULL, 'Timely appointments. I appreciated the punctuality of the clinic.', 4, b'1', 29, 2),
(143, '2024-06-22 15:28:15.000000', NULL, 'Attentive to patient needs. The doctor listened carefully to my concerns.', 5, b'1', 29, 3),
(144, '2024-06-22 15:28:15.000000', NULL, 'Professional and caring. I felt well taken care of during my visit.', 4, b'1', 29, 4),
(145, '2024-06-22 15:28:15.000000', NULL, 'Satisfied with the care received. I would recommend this doctor.', 5, b'1', 29, 5),
(146, '2024-06-22 15:28:15.000000', NULL, 'Excellent diagnosis and treatment. The doctor provided thorough care.', 4, b'1', 30, 1),
(147, '2024-06-22 15:28:15.000000', NULL, 'Friendly and knowledgeable. The doctor explained everything clearly.', 5, b'1', 30, 2),
(148, '2024-06-22 15:28:15.000000', NULL, 'Highly professional. I felt confident in the doctor expertise.', 4, b'1', 30, 3),
(149, '2024-06-22 15:28:15.000000', NULL, 'Impressed with the care. Overall, it was a positive experience.', 4, b'1', 30, 4),
(150, '2024-06-22 15:28:15.000000', NULL, 'Good experience overall. I would recommend this doctor.', 5, b'1', 30, 5),
(151, '2024-06-22 15:28:15.000000', NULL, 'Exceptional care and expertise. I am highly satisfied with the treatment.', 5, b'1', 31, 1),
(152, '2024-06-22 15:28:15.000000', NULL, 'Professional and compassionate. The doctor showed empathy.', 4, b'1', 31, 2),
(153, '2024-06-22 15:28:15.000000', NULL, 'Highly recommended doctor. I had a great experience.', 5, b'1', 31, 3),
(154, '2024-06-22 15:28:15.000000', NULL, 'Satisfied with the treatment. The doctor addressed my concerns.', 4, b'1', 31, 4),
(155, '2024-06-22 15:28:15.000000', NULL, 'Good overall experience. I am happy with the service.', 5, b'1', 31, 5),
(156, '2024-06-22 15:28:15.000000', NULL, 'Knowledgeable and attentive. The doctor answered all my questions.', 5, b'1', 32, 1),
(157, '2024-06-22 15:28:15.000000', NULL, 'Friendly and helpful staff. The clinic atmosphere was pleasant.', 4, b'1', 32, 2),
(158, '2024-06-22 15:28:15.000000', NULL, 'Satisfied with the service. The staff was efficient.', 5, b'1', 32, 3),
(159, '2024-06-22 15:28:15.000000', NULL, 'Impressed with the professionalism. Overall, it was good.', 4, b'1', 32, 4),
(160, '2024-06-22 15:28:15.000000', NULL, 'Would recommend this doctor. I had a positive experience.', 5, b'1', 32, 5),
(161, '2024-06-22 15:28:15.000000', NULL, 'Outstanding care and expertise. The doctor provided exceptional treatment.', 5, b'1', 33, 1),
(162, '2024-06-22 15:28:15.000000', NULL, 'Very satisfied with the treatment. The doctor was excellent.', 4, b'1', 33, 2),
(163, '2024-06-22 15:28:15.000000', NULL, 'Professional and friendly. The doctor made me feel comfortable.', 5, b'1', 33, 3),
(164, '2024-06-22 15:28:15.000000', NULL, 'Efficient and courteous. Overall, it was a good experience.', 4, b'1', 33, 4),
(165, '2024-06-22 15:28:15.000000', NULL, 'Highly recommend this doctor. I am satisfied with the care.', 5, b'1', 33, 5),
(166, '2024-06-22 15:28:15.000000', NULL, 'Good bedside manner. The doctor was caring and attentive.', 5, b'1', 34, 1),
(167, '2024-06-22 15:28:15.000000', NULL, 'Timely appointments. The clinic was well-organized.', 4, b'1', 34, 2),
(168, '2024-06-22 15:28:15.000000', NULL, 'Attentive to patient needs. The doctor listened to my concerns.', 5, b'1', 34, 3),
(169, '2024-06-22 15:28:15.000000', NULL, 'Professional and caring. Overall, it was a positive experience.', 4, b'1', 34, 4),
(170, '2024-06-22 15:28:15.000000', NULL, 'Satisfied with the care received. I would recommend this doctor.', 5, b'1', 34, 5),
(171, '2024-06-22 15:28:15.000000', NULL, 'Excellent diagnosis and treatment. The doctor provided thorough care.', 4, b'1', 35, 1),
(172, '2024-06-22 15:28:15.000000', NULL, 'Friendly and knowledgeable. The doctor explained everything clearly.', 5, b'1', 35, 2),
(173, '2024-06-22 15:28:15.000000', NULL, 'Highly professional. I felt confident in the doctor expertise.', 4, b'1', 35, 3),
(174, '2024-06-22 15:28:15.000000', NULL, 'Impressed with the care. Overall, it was a positive experience.', 4, b'1', 35, 4),
(175, '2024-06-22 15:28:15.000000', NULL, 'Good experience overall. I would recommend this doctor.', 5, b'1', 35, 5);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `medicals`
--

CREATE TABLE `medicals` (
  `id` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `partient_id` int(11) DEFAULT NULL,
  `prescription` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `medicals`
--

INSERT INTO `medicals` (`id`, `created_at`, `updated_at`, `content`, `name`, `partient_id`, `prescription`) VALUES
(1, '2024-06-22 15:22:08.000000', NULL, 'Fever, cough, sore throat', 'Influenza', 1, 'Paracetamol'),
(2, '2024-06-22 15:22:08.000000', NULL, 'High blood pressure, headaches', 'Hypertension', 1, 'Methyclothiazide'),
(3, '2024-06-22 15:22:08.000000', NULL, 'Increased thirst, frequent urination', 'Diabetes', 2, 'Blackmores Sugar Balance'),
(4, '2024-06-22 15:22:08.000000', NULL, 'Shortness of breath, wheezing', 'Asthma', 2, 'Ciclesonide'),
(5, '2024-06-22 15:22:08.000000', NULL, 'Joint pain, stiffness', 'Arthritis', 3, 'Hydroxychloroquine'),
(6, '2024-06-22 15:22:08.000000', NULL, 'Sneezing, itchy eyes', 'Allergies', 3, 'fexofenadin'),
(7, '2024-06-22 15:22:08.000000', NULL, 'Severe headache, nausea', 'Migraine', 4, 'celecoxib'),
(8, '2024-06-22 15:22:08.000000', NULL, 'Stomach pain, nausea', 'Gastritis', 4, 'Ranitidine'),
(9, '2024-06-22 15:22:08.000000', NULL, 'Cough, mucus production', 'Bronchitis', 5, 'histamin'),
(10, '2024-06-22 15:22:08.000000', NULL, 'Fatigue, weakness', 'Anemia', 5, 'Corticosteroid');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `day_create` datetime(6) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` bit(1) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `news`
--

INSERT INTO `news` (`id`, `created_at`, `updated_at`, `content`, `day_create`, `image`, `status`, `title`, `url`, `user_id`) VALUES
(1, '2024-06-22 15:30:33.000000', '2024-06-24 20:23:00.000000', '<p>In a recent study published in&nbsp;<a href=\"https://onlinelibrary.wiley.com/doi/10.1111/add.16564\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(24, 60, 109);\"><em>Addiction</em></a>, researchers investigated the impact of the Cannabis Act (CAC) and the coronavirus disease-19 (COVID-19) pandemic on substance-related disorders among pregnant women in Quebec.</p><p class=\"ql-align-justify\">Their results indicate that following the enactment of the CAC, there was a significant increase in cannabis-related diagnosed disorders, while the rates of other drug- and alcohol-related disorders remained stable.</p><p class=\"ql-align-justify\"><img src=\"https://d2jx2rerrg6sh3.cloudfront.net/images/news/ImageForNews_783458_454672374192476856615-620x480.jpg\" alt=\"Impact of Cannabis Act: Increase in cannabis disorders among pregnant women in Quebec\"></p><p class=\"ql-align-center\"><em style=\"color: rgb(153, 153, 153);\">Study:&nbsp;</em><a href=\"https://onlinelibrary.wiley.com/doi/10.1111/add.16564\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(153, 153, 153);\"><em>Changes in prenatal cannabis-related diagnosed disorders after the Cannabis Act and the COVID-19 pandemic in Quebec, Canada</em></a><em style=\"color: rgb(153, 153, 153);\">. Image Credit:&nbsp;Dmytro Tyshchenko/Shutterstock.com</em></p><h2><strong>Background</strong></h2><p>Research on the impacts of non-medical cannabis laws (NMCL) has explored various demographics and outcomes, but there is limited focus on pregnant women.</p><p>Previous studies in the U.S. and Canada have documented increases in prenatal cannabis use following NMCL enactments.</p><p>Concerns include the negative outcomes of prenatal cannabis use, such as preterm birth and low birth weight, and the need to protect vulnerable populations like pregnant women.</p><p>While some research indicates increased cannabis use and related hospitalizations in the general population, the specific effects on substance-related disorders during the prenatal period remain unclear, particularly outside Ontario.</p><p>Additionally, the COVID-19 pandemic\'s influence on substance use among pregnant women adds complexity, with some studies indicating increased cannabis use.</p><h2><strong>About the study</strong></h2><p>This study addressed existing research gaps by examining the impact of NMCL and the pandemic on drug- and alcohol-related disorders among pregnant women living in Quebec, leveraging its strict cannabis policies to provide insights.</p><p class=\"ql-align-justify\">Specifically, using a quasi-experimental design, researchers evaluated the impact of the pandemic and the enactment of the CAC pandemic on cannabis-, alcohol-, and drug-related diagnosed disorders among pregnant women living in Quebec from January 2010 to July 2021.</p><p>The study utilized information from the Québec Integrated Chronic Disease Surveillance System (QICDSS) database, which includes comprehensive health records for nearly all residents of Quebec.</p><p>Participants were pregnant women between the ages of 15 and 49 who had received relevant diagnoses in hospital or outpatient settings.</p><p>Diagnoses were categorized using the International Classification of Diseases (ICD) codes, focusing on three periods: pre-CAC (2010–2018), CAC (2018–2020), and the COVID-19 pandemic (2020–2021).</p><p>Monthly prevalence rates per 100,000 pregnant women were calculated for each disorder category. The analysis used Fourier terms and time trends to address potential biases in the time-series data, the analysis accounted for lags, seasonality, and time trends.</p><p>Regression models based on negative binomial distributions, with adjustments for autocorrelation and seasonality, were employed to analyze the data.</p><p>Results were presented as incidence rate ratios (IRR) and 95% confidence intervals (CI) were used. Robust standard errors were applied, and time-series plots compared actual versus predicted values.</p><h2><strong>Findings</strong></h2><p>The study analyzed 2,695 drug-related (excluding cannabis), 1,920 cannabis-related, and 833 alcohol-related disorder diagnoses among pregnant women in Quebec from January 2010 to June 2021.</p><p>The pooled mean monthly incidence rates, standardized for age, were 29.4, 17.4, and 10.9 per 100,000 pregnant women. Before the CAC, the monthly incidence of cannabis-related disorders increased significantly by 0.5%, while drug and alcohol-related disorders remained stable.</p><p>After the CAC, there was a 24% increase in cannabis-related diagnoses, with no significant changes in other drug or alcohol-related diagnoses. There was a non-significant 20% decrease in alcohol-related diagnoses during the period of the pandemic.</p><p>The study’s time-series analysis, which accounted for seasonality and autocorrelation, confirmed these trends, showing that stricter cannabis regulation in Quebec influenced the increase in cannabis-related diagnoses among pregnant women.</p><h2><strong>Conclusions</strong></h2><p>The study concluded that the prevalence of cannabis-related disorders in pregnant women living in Quebec increased significantly after the CAC was enacted. At the same time, diagnoses related to other drugs and alcohol remained stable, with a slight, non-significant decrease in alcohol-related disorders during the pandemic.</p><p>These findings align with prior research indicating a rise in cannabis-related health issues post-legalization but highlight the distinct impact on pregnant women in Quebec compared to other regions like Ontario, where a larger increase was observed.</p><p>The study\'s strengths include its use of a large, representative dataset from the QICDSS and its rigorous statistical approach. However, limitations include potential misclassification bias, under-reporting, and the lack of a control group, which future research should address.</p><p>The study emphasizes the need for universal screening and targeted counseling for pregnant women who have a history of cannabis use.</p><p>Implications of these findings suggest that stricter regulations in Quebec might influence the observed trends, and there is a need for enhanced public health efforts, including mandated pregnancy warnings on cannabis packaging.</p><p class=\"ql-align-justify\">Future research should explore the broader impact of the legislation, including non-substance-related health outcomes, and consider longer-term data to understand the trends and their implications for public health policy better.</p><p class=\"ql-align-justify\"><br></p><p class=\"ql-align-justify\"><br></p>', NULL, 'da9aab8a-d25d-47ea-9bcb-02d93301b8d0.jpg', b'1', 'Impact of Cannabis Act: Increase in cannabis disorders among pregnant women in Quebec', 'https://suckhoedoisong.vn/hoi-nghi-tim-mach-chau-au-cong-bo-ket-qua-nghien-cuu-moi-nhat-cua-cong-nghe-gia-do-dieu-hop-sinh-hoc-169240524134229654.htm', 44),
(2, '2024-06-22 15:30:33.000000', '2024-06-24 20:00:53.000000', '<p>In a recent study published in&nbsp;<a href=\"https://www.thelancet.com/journals/lanmic/article/PIIS2666-5247(24)00079-X/fulltext\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(95, 95, 95);\"><em>The Lancet Microbe</em></a><em>,&nbsp;</em>researchers investigated the association between gut microbiota composition and risk of infection-related hospitalization. Using 16S rRNA sequencing, they characterized the diversity and abundance of gut bacteria in two large, independent, European population-based cohorts.</p><p>Study findings revealed that gut microbiota compositions, specifically the abundance of butyrate-producing bacteria, may protect against severe hospitalization-requiring infections.</p><p><img src=\"https://d2jx2rerrg6sh3.cloudfront.net/images/news/ImageForNews_783460_45467266321481486568-620x480.jpg\" alt=\"Healthy gut bacteria linked to fewer infection-related hospitalizations, study finds\"></p><p class=\"ql-align-center\"><em style=\"color: rgb(153, 153, 153);\">Study:&nbsp;</em><a href=\"https://www.thelancet.com/journals/lanmic/article/PIIS2666-5247(24)00079-X/fulltext\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(153, 153, 153);\"><em>Association between butyrate-producing gut bacteria and the risk of infectious disease hospitalisation: results from two observational, population-based microbiome studies</em></a><em style=\"color: rgb(153, 153, 153);\">. Image Credit:&nbsp;Drazen Zigic/Shutterstock.com</em></p><h2><strong>Background</strong></h2><p>Despite substantial advances in modern medicine, infectious disease significantly burdens human healthcare. The Global Burden of Disease study (2019) estimated that almost 25% of all annual mortality could be attributable to severe infections.</p><p>These findings imply that current prevention and treatment modalities are insufficient in curtailing the impacts of infectious diseases and necessitate the discovery of novel strategies to prevent infections severe enough to merit hospitalization and/or death.</p><p>Recent research by the current authors and others has suggested that human gut microbial composition may be intrinsically linked to infection immunity.</p><p>A growing body of research reports that most patients with severe infections depict gut microbial perturbations at hospitalization initiation (before the onset of treatment, the latter of which exacerbates gut dysbiosis).</p><p>Mouse models have supported these observations, linking infections with reduced intestinal anaerobic bacterial abundance and a corresponding increase in potentially pathogenic gut microflora.</p><p>Unfortunately, human-derived data is mainly observational, with externally validated, geographically controlled outcomes severely lacking from the literature.</p><h2><strong>About the study</strong></h2><p>Previous research by the current authors reported an association between butyrate-producing gut-bacterial depletions and a heightened risk of respiratory infections in human patients.</p><p>The present study builds upon that research and hypothesizes that gut microbial composition and relative abundance may affect an individual\'s susceptibility to severe, hospitalization-requiring infections.</p><p>Study methodology and outcomes reporting complied with the Strengthening The Organizing and Reporting of Microbiome Studies (STORMS) reporting guidelines.</p><p>Data from the study was derived from two independent Europe-based large-scale population cohorts – the Netherlands-based HELIUS study and the Finland-based FINRISK 2002 study. Both cohorts were national hospitalization- and mortality-linked prospective studies.</p><p>HELIUS comprises Dutch citizens (ages 18-70) from Amsterdam, stratified by ethnicity. FINRISK includes random samples of adults from six Finnish regions (ages 25-74).</p><p>Data were collected using questionnaires, physical examinations, and fecal sample evaluations. All data was linked to participants\' medical and demographic records, which were used to determine primary (hospital admission or mortality) outcomes.</p><p>Following the Earth Microbiome Project protocols, fecal samples were subjected to 16S rRNA sequencing (Illumina) to determine gut bacteria composition, α-diversity, and relative abundance (Shannon Diversity Index).</p><p>Differences in community composition between participants requiring hospitalization and those that did not were computed using permutational multivariate analysis of variance (ANOVA) with Analysis of Compositions of Microbiomes with Bias Correction (ANCOM-BC) corrections applied.</p><h2><strong>Study findings</strong></h2><p>The combined participant strength of both cohorts was 10,699 (HELIUS – 4,248; FINRISK – 6,451).</p><p>The gut microbial composition across cohorts was comprised predominantly of Firmicutes (Bacillota) and Bacteroidetes, with mean relative abundances of 65.9% and 24.1%, respectively. 3.6% of the HELIUS cohort and 7.0% of the FINRISK study suffered severe infections over the study and subsequent follow-up (6 years). Infections of the lower respiratory tract were the most common.</p><p>Outcomes groups (severe infections versus healthy) displayed permutation testing-confirmed separations in gut bacterial community composition, with&nbsp;<em>Veillonella&nbsp;</em>and&nbsp;<em>Streptococcus</em>&nbsp;relative abundances substantially higher in the hospitalization or mortality group.</p><p>In contrast, healthy participants displayed a higher relative abundance of&nbsp;<em>Butyrivibrio,</em>&nbsp;an anaerobic butyrate-producing obligate microbe.</p><p><em>\"…these data showed that, in two independent cohorts, baseline gut microbiota composition differed between participants hospitalised with an infection during follow-up and those without infection-related hospitalisation, similarly driven by an increase in Veillonella and decrease of the obligate anaerobe Butyrivibrio.\"</em></p><p>Cox proportional hazard ratio estimations revealed that the relative abundance of butyrate-producing bacteria directly contributed to reduced severe infection risk. Every 10% increase in the relative abundance of these bacteria was associated with a 0.75 Cause-Specific Hazard Ratio (csHR).</p><p>Neither corrections for potential confounders (sex, age, ethnicity, alcohol usage, smoking, or comorbidities) nor the compositional nature of the microbiome altered these findings.</p><p>Together, these results highlight the relative abundance of butyrate-producing bacteria, directly associated with a decreased risk of hospitalization-requiring or mortality-causing infections.</p><p>Participants with a body mass index (BMI) exceeding 30 km/m2&nbsp;were the exception, with BMI being the only confounding variable that altered these findings. In brief,&nbsp;BMIs indicative of obesity essentially eliminated the observed association.</p><h2><strong>Conclusions</strong></h2><p>The present study highlights that in the two large independent European cohorts investigated, a higher abundance of anaerobic butyrate-producing gut bacteria was associated with substantial reductions in the risk of future severe infections.</p><p>These findings suggest gut microbiota as a potentially easily modifiable risk factor in preventing hospitalization-requiring infections.</p><p>If validated by interventional studies, these results may restrict future human susceptibility to systemic infections and inform clinicians and policymakers of the best dietary interventions to prevent the transmission of contagions at the population scale.</p>', NULL, 'ad68a5fa-724f-411e-9796-22a2ecbbc43b.jpg', b'1', 'Healthy gut bacteria linked to fewer infection-related hospitalizations, study finds', 'https://suckhoedoisong.vn/phong-ngua-sau-rang-va-cac-van-de-ve-rang-mieng-do-dung-thuoc-169240419195746389.htm', 44),
(3, '2024-06-22 15:30:33.000000', '2024-06-24 20:03:59.000000', '<p>One evening last December, Tieqiao Zhang felt severe stomach pain.</p><p>After it subsided later that night, he thought it might be food poisoning. When the pain returned the next morning, Zhang realized the source of his pain might not be as \"simple as bad food.\"</p><p>He didn\'t want to wait for an appointment with his regular doctor, but he also wasn\'t sure if the pain warranted emergency care, he said.</p><p>Zhang, 50, opted to visit Parkland Health\'s Urgent Care Emergency Center, a clinic near his home in Dallas where he\'d been treated in the past. It\'s on the campus of Parkland, the city\'s largest public hospital, which has a separate emergency room.</p><p>He believed the clinic was an urgent care center, he said.</p><p>A CT scan revealed that Zhang had a kidney stone. A physician told him it would pass naturally within a few days, and Zhang was sent home with a prescription for painkillers, he said.</p><p>Five days later, Zhang\'s stomach pain worsened. Worried and unable to get an immediate appointment with a urologist, Zhang once again visited the Urgent Care Emergency Center and again was advised to wait and see, he said.</p><p>Two weeks later, Zhang passed the kidney stone.</p><p>Then the bills came.</p><p><strong>The Patient:&nbsp;</strong>Tieqiao Zhang, 50, who is insured by BlueCross and BlueShield of Texas through his employer.</p><p><strong>Medical Services:&nbsp;</strong>Two diagnostic visits, including lab tests and CT scans.</p><p><strong>Service Provider:&nbsp;</strong>Parkland Health &amp; Hospital System. The hospital is part of the Dallas County Hospital District.</p><p><strong>Total Bills:</strong>&nbsp;The in-network hospital charged $19,543 for the two visits. BlueCross and BlueShield of Texas paid $13,070.96. Zhang owed $1,000 to Parkland — a $500 emergency room copay for each of his two visits.</p><p><strong>What Gives:&nbsp;</strong>Parkland\'s Urgent Care Emergency Center is what\'s called a freestanding emergency department.</p><p>The number of freestanding emergency rooms in the United States grew tenfold from 2001 to 2016, drawing attention for sending patients eye-popping bills. Most states allow them to operate, either by regulation or lack thereof. Some states, including Texas, have taken steps to regulate the centers, such as requiring posted notices identifying the facility as a freestanding emergency department.</p><p>Urgent care centers are a more familiar option for many patients. Research shows that, on average, urgent care visits can be about 10 times cheaper than a low-acuity — or less severe — visit to an ER.</p><p>But the difference between an urgent care clinic and a freestanding emergency room can be tough to discern.</p><p>Generally, to bill as an emergency department, facilities must meet specific requirements, such as maintaining certain staff, not refusing patients, and remaining open around the clock.</p><p>The freestanding emergency department at Parkland is 40 yards away from its main emergency room and operates under the same license, according to Michael Malaise, the spokesperson for Parkland Health. It is closed on nights and Sundays.</p><p>(Parkland\'s president and chief executive officer, Frederick Cerise, is a member of KFF\'s board of trustees. KFF Health News is an editorially independent program of KFF.) The hospital is \"very transparent\" about the center\'s status as an emergency room, Malaise told KFF Health News in a statement.</p><p>Malaise provided photographs of posted notices stating, \"This facility is a freestanding emergency medical care facility,\" and warning that patients would be charged emergency room fees and could also be charged a facility fee. He said the notices were posted in the exam rooms, lobby, and halls at the time of Zhang\'s visits.</p><p>Zhang\'s health plan required a $500 emergency room copay for each of the two visits for his kidney stone.</p><p>When Zhang visited the center in 2021 for a different health issue, he was charged only $30, his plan\'s copay for urgent care, he said. (A review of his insurance documents showed Parkland also used emergency department billing codes then. BCBS of Texas did not respond to questions about that visit.)</p><p>One reason \"I went to the urgent care instead of emergency room, although they are just next door, is the copayment,\" he said.</p><p>The list of services that Parkland\'s freestanding emergency room offers resembles that of urgent care centers — including, for some centers, diagnosing a kidney stone, said Ateev Mehrotra, a health care policy professor at Harvard Medical School.</p><p>Having choices leaves patients on their own to decipher not only the severity of their ailment, but also what type of facility they are visiting all while dealing with a health concern. Self-triage is \"a very difficult thing,\" Mehrotra said.</p><p>Zhang said he did not recall seeing posted notices identifying the center as a freestanding emergency department during his visits, nor did the front desk staff mention a $500 copay. Plus, he knew Parkland also had an emergency room, and that was not the building he visited, he said.</p><p>The name is \"misleading,\" Zhang said. \"It\'s like being tricked.\"</p><p>Parkland opened the center in 2015 to reduce the number of patients in its main emergency room, which is the busiest in the country, Malaise said. He added that the Urgent Care Emergency Center, which is staffed with emergency room providers, is \"an extension of our main emergency room and is clearly marked in multiple places as such.\"</p><p>Malaise first told KFF Health News that the facility isn\'t a freestanding ER, noting that it is located in a hospital building on the campus. Days later, he said the center is \"held out to the public as a freestanding emergency medical care facility within the definition provided by Texas law.\"</p><p>The Urgent Care Emergency Center name is intended to prevent first responders and others facing life-threatening emergencies from visiting the center rather than the main emergency room, Malaise said.</p><p>\"If you have ideas for a better name, certainly you can send that along for us to consider,\" he said.</p><p>Putting the term \"urgent\" in the clinic\'s name while charging emergency room prices is \"disingenuous,\" said Benjamin Ukert, an assistant professor of health economics and policy at Texas A&amp;M University.</p><p>When Ukert reviewed Zhang\'s bills at the request of KFF Health News, he said his first reaction was, \"Wow, I am glad that he only got charged $500; it could have been way worse\" — for instance, if the facility had been out-of-network.</p><p><strong>The Resolution:&nbsp;</strong>Zhang said he paid $400 of the $1,000 he owes in total to avoid collections while he continues to dispute the amount.</p><p>Zhang said he first reached out to his insurer, thinking his bills were wrong, before he reached out to Parkland several times by phone and email. He said customer service representatives told him that, for billing purposes, Parkland doesn\'t differentiate its Urgent Care Emergency Clinic from its emergency department.</p><p>BlueCross and BlueShield of Texas did not respond to KFF Health News when asked for comment.</p><p>Zhang said he also reached out to a county commissioner\'s office in Dallas, which never responded, and to the Texas Department of Health, which said it doesn\'t have jurisdiction over billing matters. He said the staff for his state representative, Morgan Meyer, contacted the hospital on his behalf, but later told him the hospital would not change his bill.</p><p>As of mid-May, his balance stood at $600, or $300 for each visit.</p><p><strong>The Takeaway:&nbsp;</strong>Lawmakers in Texas and around the country have tried to increase price transparency at freestanding emergency rooms, including by requiring them to hand out disclosures about billing practices.</p><p>But experts said the burden still falls disproportionately on patients to navigate the growing menu of options for care.</p><p>It\'s up to the patient to walk into the right building, said Mehrotra, the Harvard professor. It doesn\'t help that most providers are opaque about their billing practices, he said.</p><p>Mehrotra said that some freestanding emergency departments in Texas use confusing names like \"complete care,\" which mask the facilities\' capabilities and billing structure.</p><p>Ukert said states could do more to untangle the confusion patients face at such centers, like banning the use of the term \"urgent care\" to describe facilities that bill like emergency departments.</p><p><em>Bill of the Month is a crowdsourced investigation by KFF Health News and NPR that dissects and explains medical bills. Do you have an interesting medical bill you want to share with us?&nbsp;</em><a href=\"https://khn.org/send-us-your-medical-bills/\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(95, 95, 95);\"><em>Tell us about it</em></a><em>!</em></p><p><em>Emily Siner</em>&nbsp;<em>reported the audio story.</em></p>', NULL, '7c4acd6e-30af-4e15-b920-44fee406ee90.jpg', b'1', 'It’s called an urgent care emergency center — but which is it?', 'https://suckhoedoisong.vn/uong-du-nuoc-giup-giam-con-dau-dau-do-troi-nang-nong-169240524145503748.htm', 44),
(4, '2024-06-22 15:30:33.000000', '2024-06-24 20:10:53.000000', '<p>Four months after seeking asylum in the U.S., Fernando Hermida began coughing and feeling tired. He thought it was a cold. Then sores appeared in his groin and he would soak his bed with sweat. He took a test.</p><p>On New Year\'s Day 2022, at age 31, Hermida learned he had HIV.</p><p>\"I thought I was going to die,\" he said, recalling how a chill washed over him as he reviewed his results. He struggled to navigate a new, convoluted health care system. Through an HIV organization he found online, he received a list of medical providers to call in Washington, D.C., where he was at the time, but they didn\'t return his calls for weeks. Hermida, who speaks only Spanish, didn\'t know where to turn.</p><p>By the time of Hermida\'s diagnosis, the U.S. Department of Health and Human Services was about three years into a federal initiative to end the nation\'s HIV epidemic by pumping hundreds of millions of dollars annually into certain states, counties, and U.S. territories with the highest infection rates. The goal was to reach the estimated 1.2 million people living with HIV, including some who don\'t know they have the disease.</p><p>Overall, estimated new HIV infection rates declined 23%<strong>&nbsp;</strong>from 2012 to 2022. But a KFF Health News-Associated Press analysis found the rate has not fallen for Latinos as much as it has for other racial and ethnic groups.</p><p>While African Americans continue to have the highest HIV rates in the United States overall, Latinos made up the largest share of new HIV diagnoses and infections among gay and bisexual men in 2022,<strong>&nbsp;</strong>per the most recent data available, compared with other racial and ethnic groups. Latinos, who make up about 19% of the U.S. population, accounted for about 33% of new HIV infections, according to the Centers for Disease Control and Prevention.</p><p>The analysis found Latinos are experiencing a disproportionate number of new infections and diagnoses across the U.S., with diagnosis rates highest in the Southeast. Public health officials in Mecklenburg County, North Carolina, and Shelby County, Tennessee, where data shows diagnosis rates have gone up among Latinos, told KFF Health News and the AP that they either don\'t have specific plans to address HIV in this population or that plans are still in the works. Even in well-resourced places like San Francisco, California, HIV diagnosis rates grew among Latinos in the last few years while falling among other racial and ethnic groups despite the county\'s goals to reduce infections among Latinos.</p><p>\"HIV disparities are not inevitable,\" Robyn Neblett Fanfair, director of the CDC\'s Division of HIV Prevention, said in a statement. She noted the systemic, cultural, and economic inequities — such as racism, language differences, and medical mistrust.</p><p><br></p><p><strong>And though the CDC provides some funds for minority groups, Latino health policy advocates want HHS&nbsp;</strong>to declare a public health emergency in hopes of directing more money to Latino communities, saying current efforts aren\'t enough.</p><p>\"Our invisibility is no longer tolerable,\" said Vincent Guilamo-Ramos, co-chair of the Presidential Advisory Council on HIV/AIDS.</p><h2><strong>Lost without an interpreter</strong></h2><p>Hermida suspects he contracted the virus while he was in an open relationship with a male partner before he came to the U.S. In late January 2022, months after his symptoms started, he went to a clinic in New York City that a friend had helped him find to finally get treatment for HIV.</p><p>Too sick to care for himself alone, Hermida eventually moved to Charlotte, North Carolina, to be closer to family and in hopes of receiving more consistent health care. He enrolled in an Amity Medical Group clinic that receives funding from the Ryan White HIV/AIDS Program, a federal safety-net plan that serves over half of those in the nation diagnosed with HIV, regardless of their citizenship status.</p><p>His HIV became undetectable after he was connected with case managers. But over time, communication with the clinic grew less frequent, he said, and he didn\'t get regular interpretation help during visits with his English-speaking doctor. An Amity Medical Group representative confirmed Hermida was a client but didn\'t answer questions about his experience at the clinic.</p><p>Hermida said he had a hard time filling out paperwork to stay enrolled in the Ryan White program, and when his eligibility expired in September 2023, he couldn\'t get his medication.</p><p>He left the clinic and enrolled in a health plan through the Affordable Care Act marketplace. But Hermida didn\'t realize the insurer required him to pay for a share of his HIV treatment.</p><p>In January, the Lyft driver received a $1,275 bill for his antiretroviral — the equivalent of 120 rides, he said. He paid the bill with a coupon he found online. In April, he got a second bill he couldn\'t afford.</p><p>For two weeks, he stopped taking the medication that keeps the virus undetectable and intransmissible.</p><p>\"Estoy que colapso<em>,\"&nbsp;</em>he said. I\'m falling apart. \"Tengo que vivir para pagar la medicación.\" I have to live to pay for my medication.</p><p><br></p><p><strong>One way to prevent HIV is preexposure prophylaxis, or PrEP, which is regularly taken to reduce the risk of getting HIV through sex or intravenous drug use. It was approved by the federal government in 2012 but the uptake has not been even across racial and ethnic groups: CDC data show much lower rates of PrEP coverage among Latinos than among white Americans.</strong></p><p><strong>Epidemiologists say high PrEP use and consistent access to treatment are necessary to build community-level resistance.</strong></p><p><strong>Carlos Saldana, an infectious disease specialist and former medical adviser for Georgia\'s health department, helped identify five clusters of rapid HIV transmission involving about 40 gay Latinos and men who have sex with men from February 2021 to June 2022. Many people in the cluster told researchers they had not taken PrEP and struggled to understand the health care system.</strong></p><p><strong>They experienced other barriers, too, Saldana said, including lack of transportation and fear of deportation if they sought treatment.</strong></p><p class=\"ql-align-justify\"><strong>Latino health policy advocates want the federal government to redistribute funding for HIV prevention, including testing and access to PrEP. Of the nearly $30 billion in federal money that went toward things like HIV health care services, treatment, and prevention in 2022, only 4% went to prevention, according to a KFF analysis.</strong></p><p class=\"ql-align-justify\"><br></p><p>They suggest more money could help reach Latino communities through efforts like faith-based outreach at churches, testing at clubs on Latin nights, and training bilingual HIV testers.</p><h2><strong>Latino rates going up</strong></h2><p>Congress has appropriated $2.3 billion over five years to the Ending the HIV Epidemic initiative, and jurisdictions that get the money are to invest 25% of it in community-based organizations. But the initiative lacks requirements to target any particular groups, including Latinos, leaving it up to the cities, counties, and states to come up with specific strategies.</p><p>In 34 of the 57 areas getting the money, cases are going the wrong way: Diagnosis rates among Latinos increased from 2019 to 2022 while declining for other racial and ethnic groups, the KFF Health News-AP analysis found.</p><p>Starting Aug. 1, state and local health departments will have to provide annual spending reports on funding in places that account for 30% or more of HIV diagnoses, the CDC said. Previously, it had been required for only a small number of states.</p><p>In some states and counties, initiative funding has not been enough to cover the needs of Latinos.</p><p>South Carolina,<strong>&nbsp;</strong>which saw rates nearly double for Latinos from 2012 to 2022,<strong>&nbsp;</strong>hasn\'t expanded HIV mobile testing in rural areas, where the need is high among Latinos, said Tony Price, HIV program manager in the state health department. South Carolina can pay for only four community health workers focused on HIV outreach — and not all of them are bilingual.</p><p>In Shelby County, Tennessee, home to Memphis, the Latino HIV diagnosis rate rose 86% from 2012 to 2022. The health department said it got $2 million in initiative funding in 2023 and while the county plan acknowledges that Latinos are a target group, department director Michelle Taylor said: \"There are no specific campaigns just among Latino people.\"</p><p>Up to now, Mecklenburg County, North Carolina, didn\'t include specific targets to address HIV in the Latino population — where rates of new diagnoses more than doubled in a decade but fell slightly among other racial and ethnic groups. The health department has used funding for bilingual marketing campaigns and awareness about PrEP.</p><h2><strong>Moving for medicine</strong></h2><p>When it was time to pack up and move to Hermida\'s third city in two years, his fiancé, who is taking PrEP, suggested seeking care in Orlando, Florida.</p><p>The couple, who were friends in high school in Venezuela, had some family and friends in Florida, and they had heard about Pineapple Healthcare, a nonprofit primary care clinic dedicated to supporting Latinos living with HIV.</p><p>The clinic is housed in a medical office south of downtown Orlando. Inside, the mostly Latino staff is dressed in pineapple-print turquoise shirts, and Spanish, not English, is most commonly heard in appointment rooms and hallways.</p><p>\"At the core of it, if the organization is not led by and for people of color, then we\'re just an afterthought,\" said Andres Acosta Ardila, the community outreach director at Pineapple Healthcare, who was diagnosed with HIV in 2013.</p><p>\"¿Te mudaste reciente, ya por fin?\" asked nurse practitioner Eliza Otero. Did you finally move? She started treating Hermida while he still lived in Charlotte. \"Hace un mes que no nos vemos.\" It\'s been a month since we last saw each other.</p><p>They still need to work on lowering his cholesterol and blood pressure, she told him. Though his&nbsp;<a href=\"https://www.news-medical.net/health/What-is-Viral-Load.aspx\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(95, 95, 95);\">viral load</a>&nbsp;remains high, Otero said it should improve with regular, consistent care.</p><p>Pineapple Healthcare, which doesn\'t receive initiative money, offers full-scope primary care to mostly Latino males. Hermida gets his HIV medication at no cost there because the clinic is part of a federal drug discount program.</p><p>The clinic is in many ways an oasis. The new diagnosis rate for Latinos in Orange County, Florida, which includes Orlando, rose by about a third from 2012 through 2022, while dropping by a third for others. Florida has the third-largest Latino population in the U.S., and had the seventh-highest rate of new HIV diagnoses among Latinos in the nation in 2022.</p><p>Hermida, whose asylum case is pending, never imagined getting medication would be so difficult, he said during the 500-mile drive from North Carolina to Florida. After hotel rooms, jobs lost, and family goodbyes, he is hopeful his search for consistent HIV treatment — which has come to define his life the past two years — can finally come to an end.</p><p>\"Soy un nómada a la fuerza, pero bueno, como me comenta mi prometido y mis familiares, yo tengo que estar donde me den buenos servicios médicos,\" he said. I\'m forced to be a nomad, but like my family and my fiancé say, I have to be where I can get good medical services.</p><p>That\'s the priority, he said. \"Esa es la prioridad ahora.\"</p><p><em>KFF Health News and The Associated Press analyzed data from the U.S. Centers for Disease Control and Prevention on the number of new HIV diagnoses and infections among Americans ages 13 and older at the local, state, and national levels. This story primarily uses incidence rate data — estimates of new infections — at the national level and diagnosis rate data at the state and county level.</em></p><p><em>Bose reported from Orlando, Florida. Reese reported from Sacramento, California.</em>&nbsp;<em>AP video journalist Laura Bargfeld contributed to this report.</em></p><p><em>The Associated Press Health and Science Department receives support from the Robert Wood Johnson Foundation. The AP is responsible for all content.</em></p><p class=\"ql-align-justify\"><em>This article was produced by KFF Health News, which publishes California Healthline, an editorially independent service of the California Health Care Foundation.</em>&nbsp;</p>', NULL, '6db5c870-4d2c-4981-af73-158a9cc79cf6.jpg', b'1', 'Young Latinos see rising share of new HIV cases, leading to call for targeted funding', 'https://suckhoedoisong.vn/kiem-soat-dich-covid-19-tot-nen-bo-y-te-khong-su-dung-toi-nguon-46-nghin-ty-dong-16924052511140927.htm', 44),
(5, '2024-06-22 15:30:33.000000', '2024-06-24 20:12:18.000000', '<p><span style=\"color: rgb(51, 51, 51);\">Polyfluoroalkyl substances (PFAS) are a class of chemicals extensively used in consumer goods production due to their hydrophobic and oleophobic properties and stability. However, their persistence in the environment and bioaccumulation in living organisms have sparked concerns about potential health effects. Previous studies have linked PFAS exposure to various adverse outcomes, including developmental issues in children.</span></p><p><br></p><p><span style=\"color: rgb(51, 51, 51);\">A recent study (DOI:10.1016/j.eehl.2024.04.007) published in&nbsp;</span><em style=\"color: rgb(51, 51, 51);\">Eco-Environment &amp; Health</em><span style=\"color: rgb(51, 51, 51);\">&nbsp;on May 8, 2024, has highlighted the levels, health risks, and transport protein binding capabilities of per- and polyfluoroalkyl substances (PFAS) in early life based on the Shanghai Maternal-Child Pairs Cohort. Found in maternal serum, cord serum, and breast milk, these synthetic chemicals pose potential health risks for infants. Led by research team from School of Public Health at Fudan University, the research team meticulously analyzed the transfer mechanisms and impacts of these persistent chemicals, providing crucial insights into their pervasive presence from pregnancy to lactation.</span></p><p><br></p><p><span style=\"color: rgb(51, 51, 51);\">Employing high-performance liquid chromatography-tandem mass spectrometry, the study analyzed 16 types of PFAS in 1,076 mother-child pairs. It revealed the detection rates and median concentrations of perfluorooctane sulfonate (PFOS), perfluorooctanoic acid (PFOA), and 6:2 Cl-PFESA, with PFOS most prevalent in maternal serum. Notably, placental transfer efficiency of PFAS was higher than breastfeeding transfer, suggesting that these chemicals are more likely to cross the placenta and accumulate in the fetus. Additionally, the research utilized molecular docking to simulate the binding of PFAS to transport proteins, potentially influencing their distribution and transport within the body. These findings underscore the need for tighter PFAS regulations and further research into their environmental and health effects.</span></p><p><br></p><p><span style=\"color: rgb(51, 51, 51);\">The implications of this research are profound, particularly for public health policies and infant safety. By identifying specific PFAS compounds more likely to transfer through the placenta and into breast milk, preventive measures can be more effectively targeted. Moreover, the study\'s findings could influence future guidelines on the use of PFAS-containing products by pregnant women and nursing mothers.</span></p>', NULL, '402409f2-e05a-490f-860e-b333581adf07.jpg', b'1', 'PFAS exposure in early life: Health risks and maternal-fetal transport mechanisms', 'https://suckhoedoisong.vn/4-chat-bo-sung-giup-giam-dau-khop-169240521111933326.htm', 44),
(6, '2024-06-22 15:30:33.000000', '2024-06-24 20:14:51.000000', '<p>The accumulation of microplastics in the ecosystem is rapidly becoming an environmental and public health concern. In a recent study published in the&nbsp;<a href=\"https://www.nature.com/articles/s41443-024-00930-6\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(95, 95, 95);\"><em>International Journal of Impotence Research</em></a>, a team of researchers assessed the accumulation of microplastics in penile tissue to determine potential toxicity concerns.</p><h2><strong>Background</strong></h2><p>Microplastics with diameters less than 5 mm have spread across terrestrial and aquatic ecosystems and the atmosphere, becoming a serious environmental concern. Detecting microplastics in the gastrointestinal tracts of various animals, especially marine animals, has further highlighted the danger microplastics pose to the environment.</p><p>Recent studies have also reported the accumulation of microplastics in human organs and tissues, such as cardiac tissue, lungs, placenta, and stool samples, indicating that microplastic pollution is rapidly becoming a significant health concern.</p><p>Microplastics\' small size allows them to interact with the body and trigger immune responses. The potential introduction of chemical pollutants and pathogens into the body through microplastics also raises health concerns.</p><h2><strong>About the study</strong></h2><p>In the present study, the researchers used laser direct infrared microspectroscopy to detect microplastic aggregation in penile tissue obtained from patients with erectile dysfunction undergoing a procedure to insert an inflatable penile prosthesis.</p><p>While ingestion and inhalation of microplastics can lead to accumulation in organs such as the liver, intestines, kidneys, and lungs, and potentially in the circulatory system, dermal contact is of concern only with regards to microplastics less than 100 nm in size, which can traverse the skin. Very small microplastics can infiltrate cells and interfere with cellular function.</p><p>Recent studies have shown that microplastic accumulation in the body can impact sperm quality, fertility, and reproductive success. They can also cause abnormalities in sperm morphology and reduce sperm count.</p><p><br></p><p>The present study included six patients with erectile dysfunction who underwent a surgical procedure for multi-component inflatable penile prosthesis insertion. Samples of the corpora were obtained during the surgery.</p><p>A stringent protocol involving only glass and metal labware was followed to ensure no contamination of the tissue samples with microplastics from external sources. A control sample was also included, where the tissue was stored in a McKesson plastic specimen container.</p><p>The identification of the microplastic polymers using laser direct infrared microspectroscopy was initially validated using a range of microplastic reference materials such as acrylonitrile butadiene styrene, artificially aged polyamide, cellulose acetate powder, cryomilled polystyrene, polyethylene terephthalate, polyethylene, polyethylene, polypropylene, and polyvinyl chloride from various sources.</p><p>Microplastics were extracted from the tissue samples using a combination of sodium hypochlorite and potassium hydroxide and filtered using gold-coated polyethylene terephthalate glycol membrane filters.</p><p>The particles were analyzed for polymer type, size, and size number distribution using a laser direct infrared chemical imaging system.</p><p>The infrared spectra of all the synthetic polymer types that were assigned were checked to account for any interference from fatty acid remnants. Additionally, scanning electron microscopy was used to investigate the filters used in the laser direct infrared spectroscopy and observe the morphology of the particles.</p><h2><strong>Results</strong></h2><p>The study found that laser direct infrared spectroscopy could identify microplastics between the size range of 20 µm to 500 µm in over 80% of the samples, while scanning electron microscopy detected samples as small as 2 µm in diameter in the corpora samples.</p><p>The penile tissue samples had seven different types of microplastics, with polyethylene terephthalate and polypropylene constituting 47.8% and 34.7% of the microplastics, respectively.</p><p>These two types of microplastics are the commonly used non-biodegradable polymers in packaging and everyday goods such as beverage and food packaging and reusable plastic bottles and containers.</p><p>Previous studies have examined and reported the impact of microplastics on sperm quality and number and male infertility. Murine model studies have also shown that mice that ingested microplastics through drinking water showed reduced live sperm count compared to controls.</p><p>Studies have also indicated that microplastics can cause morphological abnormalities in the sperm, along with an increase in inflammatory markers such as nuclear factor κB and interleukins B and 6. The findings from this study also suggested that microplastic aggregation in penile tissue could be linked to erectile dysfunction, which warrants further research.</p><h2><strong>Conclusions</strong></h2><p>Overall, the findings reported that over 80% of the penile tissue samples had microplastics ranging from 20 µm to 500 µm, and some as small as 2 µm. Polyethylene terephthalate and polypropylene were the two most common microplastic polymers in the penile tissue samples.</p><p>Given the existing evidence on the association between microplastic aggregation and decreased sperm quality and number and the findings from the present study, the researchers believe that the possible association between microplastic accumulation in the penile tissue and erectile dysfunction needs to be explored further.</p>', NULL, '16752422-ad60-4a0c-81b8-b5076531d43d.jpg', b'1', 'Research finds microplastics in human penile tissue', 'https://suckhoedoisong.vn/phe-duyet-dovato-tri-hiv-cho-thanh-thieu-nien-169240410141053408.htm', 44);
COMMIT;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `partients`
--

CREATE TABLE `partients` (
  `id` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` bit(1) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `partients`
--

INSERT INTO `partients` (`id`, `created_at`, `updated_at`, `address`, `birthday`, `fullname`, `gender`, `image`, `status`, `user_id`) VALUES
(1, '2024-06-22 15:22:08.000000', NULL, '123 Main St, San Francisco, CA, USA', '1992-05-12', 'John Doe', 'Male', '3faa6a21-8a3a-414f-9aab-9357e202a1fd.png', b'1', 36),
(2, '2024-06-22 15:22:08.000000', '2024-06-23 22:16:42.000000', '456 Elm St, Los Angeles, CA, USA', '1995-09-08', 'Michael Smith 01', 'Male', '8ee38c5a-298a-4374-aabd-92585976e09b.png', b'1', 37),
(3, '2024-06-22 15:22:08.000000', NULL, '789 Oak St, Chicago, IL, USA', '1998-04-20', 'James Johnson', 'Male', '55ff9862-0848-4ce9-bd61-1e26ac0da067.png', b'1', 38),
(4, '2024-06-22 15:22:08.000000', NULL, '101 Pine St, New York, NY, USA', '1991-07-03', 'Emily Davis', 'Female', '5e36689e-c77b-4b9b-a2ee-088ab9317ce9.png', b'1', 39),
(5, '2024-06-22 15:22:08.000000', NULL, '234 Maple Ave, Houston, TX, USA', '1997-10-16', 'Sophia Brown', 'Female', '1a8ba3e1-e158-4e04-8261-f2bdbc6b6289.png', b'1', 40);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `qualifications`
--

CREATE TABLE `qualifications` (
  `id` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `course` varchar(255) DEFAULT NULL,
  `degree_name` varchar(255) DEFAULT NULL,
  `status` bit(1) NOT NULL,
  `university_name` varchar(255) DEFAULT NULL,
  `doctor_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `qualifications`
--

INSERT INTO `qualifications` (`id`, `created_at`, `updated_at`, `course`, `degree_name`, `status`, `university_name`, `doctor_id`) VALUES
(1, '2024-06-22 15:28:15.000000', NULL, 'Medicine', 'Doctor of Medicine (MD)', b'1', 'Harvard Medical School', 1),
(2, '2024-06-22 15:28:15.000000', NULL, 'Biology', 'Bachelor of Science (BS)', b'1', 'Yale University', 2),
(3, '2024-06-22 15:28:15.000000', NULL, 'Chemistry', 'Bachelor of Science (BS)', b'1', 'Stanford University', 3),
(4, '2024-06-22 15:28:15.000000', NULL, 'Nursing', 'Bachelor of Science in Nursing (BSN)', b'1', 'University of California, Los Angeles', 4),
(5, '2024-06-22 15:28:15.000000', NULL, 'Psychology', 'Bachelor of Arts (BA)', b'1', 'University of California, Berkeley', 5),
(6, '2024-06-22 15:28:15.000000', NULL, 'Engineering', 'Bachelor of Science (BS)', b'1', 'California Institute of Technology', 6),
(7, '2024-06-22 15:28:15.000000', NULL, 'Computer Science', 'Bachelor of Science (BS)', b'1', 'Massachusetts Institute of Technology', 7),
(8, '2024-06-22 15:28:15.000000', NULL, 'Law', 'Juris Doctor (JD)', b'1', 'Columbia University', 8),
(9, '2024-06-22 15:28:15.000000', NULL, 'Education', 'Master of Education (MEd)', b'1', 'University of Pennsylvania', 9),
(10, '2024-06-22 15:28:15.000000', NULL, 'Economics', 'Bachelor of Arts (BA)', b'1', 'University of Chicago', 10),
(11, '2024-06-22 15:28:15.000000', NULL, 'Business Administration', 'Master of Business Administration (MBA)', b'1', 'University of Michigan', 11),
(12, '2024-06-22 15:28:15.000000', NULL, 'Political Science', 'Bachelor of Arts (BA)', b'1', 'Princeton University', 12),
(13, '2024-06-22 15:28:15.000000', NULL, 'English Literature', 'Bachelor of Arts (BA)', b'1', 'Brown University', 13),
(14, '2024-06-22 15:28:15.000000', NULL, 'History', 'Bachelor of Arts (BA)', b'1', 'Duke University', 14),
(15, '2024-06-22 15:28:15.000000', NULL, 'Physics', 'Bachelor of Science (BS)', b'1', 'California Institute of Technology', 15),
(16, '2024-06-22 15:28:15.000000', NULL, 'Mathematics', 'Bachelor of Science (BS)', b'1', 'Harvard University', 16),
(17, '2024-06-22 15:28:15.000000', NULL, 'Sociology', 'Bachelor of Arts (BA)', b'1', 'Northwestern University', 17),
(18, '2024-06-22 15:28:15.000000', NULL, 'Communications', 'Bachelor of Arts (BA)', b'1', 'University of Southern California', 18),
(19, '2024-06-22 15:28:15.000000', NULL, 'Fine Arts', 'Bachelor of Fine Arts (BFA)', b'1', 'Rhode Island School of Design', 19),
(20, '2024-06-22 15:28:15.000000', NULL, 'Philosophy', 'Bachelor of Arts (BA)', b'1', 'University of California, Berkeley', 20),
(21, '2024-06-22 15:28:15.000000', NULL, 'Environmental Science', 'Bachelor of Science (BS)', b'1', 'Stanford University', 21),
(22, '2024-06-22 15:28:15.000000', NULL, 'Geology', 'Bachelor of Science (BS)', b'1', 'University of California, Santa Barbara', 22),
(23, '2024-06-22 15:28:15.000000', NULL, 'Anthropology', 'Bachelor of Arts (BA)', b'1', 'Harvard University', 23),
(24, '2024-06-22 15:28:15.000000', NULL, 'Music', 'Bachelor of Arts (BA)', b'1', 'Juilliard School', 24),
(25, '2024-06-22 15:28:15.000000', NULL, 'Theater Arts', 'Bachelor of Fine Arts (BFA)', b'1', 'New York University', 25),
(26, '2024-06-22 15:28:15.000000', NULL, 'Dentistry', 'Doctor of Dental Surgery (DDS)', b'1', 'University of Pennsylvania', 26),
(27, '2024-06-22 15:28:15.000000', NULL, 'Pharmacy', 'Doctor of Pharmacy (PharmD)', b'1', 'University of California, San Francisco', 27),
(28, '2024-06-22 15:28:15.000000', NULL, 'Veterinary Medicine', 'Doctor of Veterinary Medicine (DVM)', b'1', 'Cornell University', 28),
(29, '2024-06-22 15:28:15.000000', NULL, 'Public Health', 'Master of Public Health (MPH)', b'1', 'Johns Hopkins University', 29),
(30, '2024-06-22 15:28:15.000000', NULL, 'Social Work', 'Master of Social Work (MSW)', b'1', 'University of Michigan', 30),
(31, '2024-06-22 15:28:15.000000', NULL, 'Nutrition', 'Bachelor of Science (BS)', b'1', 'University of California, Davis', 31),
(32, '2024-06-22 15:28:15.000000', NULL, 'Physical Therapy', 'Doctor of Physical Therapy (DPT)', b'1', 'University of Southern California', 32),
(33, '2024-06-22 15:28:15.000000', NULL, 'Occupational Therapy', 'Master of Occupational Therapy (MOT)', b'1', 'Washington University in St. Louis', 33),
(34, '2024-06-22 15:28:15.000000', NULL, 'Speech-Language Pathology', 'Master of Science (MS)', b'1', 'University of Iowa', 34),
(35, '2024-06-22 15:28:15.000000', NULL, 'Biomedical Engineering', 'Bachelor of Science (BS)', b'1', 'Georgia Institute of Technology', 35),
(36, '2024-06-22 15:28:15.000000', NULL, 'Occupational Therapy', 'Doctor of Medicine (MD)', b'1', 'Harvard Medical School', 1),
(37, '2024-06-22 15:28:15.000000', NULL, 'Nursing', 'Bachelor of Science in Nursing (BSN)', b'1', 'Johns Hopkins University', 2),
(38, '2024-06-22 15:28:15.000000', NULL, 'Pharmacy', 'Doctor of Pharmacy (Pharm.D)', b'1', 'University of California, San Francisco', 3),
(39, '2024-06-22 15:28:15.000000', NULL, 'Dentistry', 'Doctor of Dental Surgery (DDS)', b'1', 'University of Pennsylvania School of Dental Medicine', 4),
(40, '2024-06-22 15:28:15.000000', NULL, 'Physical Therapy', 'Doctor of Physical Therapy (DPT)', b'1', 'University of Southern California', 5),
(41, '2024-06-22 15:28:15.000000', NULL, 'Optometry', 'Doctor of Optometry (OD)', b'1', 'University of California, Berkeley', 6),
(42, '2024-06-22 15:28:15.000000', NULL, 'Physician Assistant Studies', 'Master of Physician Assistant Studies (MPAS)', b'1', 'Yale School of Medicine', 7),
(43, '2024-06-22 15:28:15.000000', NULL, 'Public Health', 'Master of Public Health (MPH)', b'1', 'Harvard T.H. Chan School of Public Health', 8),
(44, '2024-06-22 15:28:15.000000', NULL, 'Occupational Therapy', 'Master of Occupational Therapy (MOT)', b'1', 'Washington University in St. Louis', 9),
(45, '2024-06-22 15:28:15.000000', NULL, 'Clinical Psychology', 'Doctor of Psychology (PsyD)', b'1', 'Stanford University', 10),
(46, '2024-06-22 15:28:15.000000', NULL, 'Nurse Anesthesia', 'Master of Science in Nurse Anesthesia', b'1', 'Rush University', 11),
(47, '2024-06-22 15:28:15.000000', NULL, 'Speech-Language Pathology', 'Master of Science in Speech-Language Pathology (MS-SLP)', b'1', 'Northwestern University', 12),
(48, '2024-06-22 15:28:15.000000', NULL, 'Medical Laboratory Science', 'Bachelor of Science in Medical Laboratory Science (BS-MLS)', b'1', 'University of Michigan', 13),
(49, '2024-06-22 15:28:15.000000', NULL, 'Nutrition and Dietetics', 'Master of Science in Nutrition and Dietetics', b'1', 'Tufts University', 14),
(50, '2024-06-22 15:28:15.000000', NULL, 'Clinical Social Work', 'Master of Social Work (MSW)', b'1', 'University of Chicago', 15),
(51, '2024-06-22 15:28:15.000000', NULL, 'Biomedical Engineering', 'Bachelor of Science in Biomedical Engineering (BS-BME)', b'1', 'Georgia Institute of Technology', 16),
(52, '2024-06-22 15:28:15.000000', NULL, 'Healthcare Administration', 'Master of Healthcare Administration (MHA)', b'1', 'University of Minnesota', 17),
(53, '2024-06-22 15:28:15.000000', NULL, 'Health Informatics', 'Master of Science in Health Informatics (MSHI)', b'1', 'University of Washington', 18),
(54, '2024-06-22 15:28:15.000000', NULL, 'Clinical Research', 'Master of Science in Clinical Research (MSCR)', b'1', 'Duke University', 19),
(55, '2024-06-22 15:28:15.000000', NULL, 'Epidemiology', 'Master of Science in Epidemiology', b'1', 'University of North Carolina at Chapel Hill', 20),
(56, '2024-06-22 15:28:15.000000', NULL, 'Genetic Counseling', 'Master of Science in Genetic Counseling', b'1', 'Emory University', 21),
(57, '2024-06-22 15:28:15.000000', NULL, 'Radiologic Technology', 'Bachelor of Science in Radiologic Technology (BSRT)', b'1', 'Oregon Institute of Technology', 22),
(58, '2024-06-22 15:28:15.000000', NULL, 'Respiratory Therapy', 'Bachelor of Science in Respiratory Therapy (BSRT)', b'1', 'Texas State University', 23),
(59, '2024-06-22 15:28:15.000000', NULL, 'Sonography', 'Bachelor of Science in Diagnostic Medical Sonography (BS-DMS)', b'1', 'University of Iowa', 24),
(60, '2024-06-22 15:28:15.000000', NULL, 'Health Education', 'Master of Science in Health Education', b'1', 'University of Wisconsin-Madison', 25),
(61, '2024-06-22 15:28:15.000000', NULL, 'Biostatistics', 'Master of Science in Biostatistics', b'1', 'University of Pittsburgh', 26),
(62, '2024-06-22 15:28:15.000000', NULL, 'Clinical Laboratory Science', 'Bachelor of Science in Clinical Laboratory Science (BS-CLS)', b'1', 'University of Utah', 27),
(63, '2024-06-22 15:28:15.000000', NULL, 'Health Information Management', 'Bachelor of Science in Health Information Management (BS-HIM)', b'1', 'Ohio State University', 28),
(64, '2024-06-22 15:28:15.000000', NULL, 'Rehabilitation Counseling', 'Master of Rehabilitation Counseling (MRC)', b'1', 'Florida State University', 29),
(65, '2024-06-22 15:28:15.000000', NULL, 'Orthotics and Prosthetics', 'Master of Science in Orthotics and Prosthetics', b'1', 'Northwestern University', 30),
(66, '2024-06-22 15:28:15.000000', NULL, 'Healthcare Management', 'Master of Science in Healthcare Management', b'1', 'Boston University', 31),
(67, '2024-06-22 15:28:15.000000', NULL, 'Medical Illustration', 'Master of Science in Medical Illustration', b'1', 'Medical College of Georgia', 32),
(68, '2024-06-22 15:28:15.000000', NULL, 'Clinical Nurse Leader', 'Master of Science in Nursing - Clinical Nurse Leader (MSN-CNL)', b'1', 'University of Maryland', 33),
(69, '2024-06-22 15:28:15.000000', NULL, 'Cytotechnology', 'Bachelor of Science in Cytotechnology (BS-CT)', b'1', 'University of Wisconsin-Madison', 34),
(70, '2024-06-22 15:28:15.000000', NULL, 'Perfusion Technology', 'Bachelor of Science in Perfusion Technology (BSPT)', b'1', 'University of Iowa', 35);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `refresh_token`
--

CREATE TABLE `refresh_token` (
  `id` int(11) NOT NULL,
  `available` bit(1) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `expired_at` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `refresh_token`
--

INSERT INTO `refresh_token` (`id`, `available`, `code`, `expired_at`, `user_id`) VALUES
(1, NULL, '4efa95dd-4789-43cd-9644-d166c308d652', '2024-06-29 23:00:00', 1),
(2, NULL, '4efa95dd-4985-43cd-5744-d166c308d653', '2024-06-29 23:00:00', 2),
(3, NULL, '4efa95dd-9604-43cd-2387-d166c308d654', '2024-06-29 23:00:00', 3),
(4, NULL, 'e31489a1-6c38-4133-b651-d166c308d655', '2024-06-29 23:00:00', 4),
(5, NULL, 'e31589a1-6c38-4133-b651-d166c308d656', '2024-06-29 23:00:00', 5),
(6, NULL, '4efa95dd-4789-43cd-9644-d166c308d657', '2024-06-29 23:00:00', 36),
(7, NULL, '4efa95dd-4985-43cd-5744-d166c308d658', '2024-06-29 23:00:00', 37),
(8, NULL, '4efa95dd-9604-43cd-2387-d166c308d659', '2024-06-29 23:00:00', 38),
(9, NULL, 'e31489a1-6c38-4133-b651-d166c308d660', '2024-06-29 23:00:00', 39),
(10, NULL, 'e31589a1-6c38-4133-b651-d166c308d661', '2024-06-29 23:00:00', 40),
(11, NULL, '4efa95dd-4789-43cd-9644-d166c308d662', '2024-06-29 23:00:00', 41),
(12, NULL, '4efa95dd-4985-43cd-5744-d166c308d663', '2024-06-29 23:00:00', 42),
(13, NULL, '4efa95dd-9604-43cd-2387-d166c308d664', '2024-06-29 23:00:00', 43),
(14, NULL, 'e31489a1-6c38-4133-b651-d166c308d665', '2024-06-29 23:00:00', 44);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `short_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`id`, `name`, `short_name`) VALUES
(1, 'ROLE_USER', 'USER'),
(2, 'ROLE_DOCTOR', 'DOCTOR'),
(3, 'ROLE_ADMIN', 'ADMIN');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `schedules`
--

CREATE TABLE `schedules` (
  `id` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `day_working` date DEFAULT NULL,
  `status` bit(1) NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  `slot_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `schedules`
--

INSERT INTO `schedules` (`id`, `created_at`, `updated_at`, `day_working`, `status`, `department_id`, `slot_id`) VALUES
(1, '2024-06-22 15:29:52.000000', NULL, '2024-07-02', b'1', 1, 6),
(2, '2024-06-22 15:29:52.000000', NULL, '2024-07-03', b'1', 1, 6),
(3, '2024-06-22 15:29:52.000000', NULL, '2024-07-04', b'1', 1, 6),
(4, '2024-06-22 15:29:52.000000', NULL, '2024-07-05', b'1', 1, 6),
(5, '2024-06-22 15:29:52.000000', NULL, '2024-07-06', b'1', 1, 6),
(6, '2024-06-22 15:29:52.000000', NULL, '2024-07-02', b'1', 1, 5),
(7, '2024-06-22 15:29:52.000000', NULL, '2024-07-03', b'1', 1, 5),
(8, '2024-06-22 15:29:52.000000', NULL, '2024-07-04', b'1', 1, 5),
(9, '2024-06-22 15:29:52.000000', NULL, '2024-07-05', b'1', 1, 5),
(10, '2024-06-22 15:29:52.000000', NULL, '2024-07-06', b'1', 1, 5),
(11, '2024-06-22 15:29:52.000000', NULL, '2024-07-02', b'1', 1, 4),
(12, '2024-06-22 15:29:52.000000', NULL, '2024-07-03', b'1', 1, 4),
(13, '2024-06-22 15:29:52.000000', NULL, '2024-07-04', b'1', 1, 4),
(14, '2024-06-22 15:29:52.000000', NULL, '2024-07-05', b'1', 1, 4),
(15, '2024-06-22 15:29:52.000000', NULL, '2024-07-06', b'1', 1, 4),
(16, '2024-06-22 15:29:52.000000', NULL, '2024-07-02', b'1', 1, 3),
(17, '2024-06-22 15:29:52.000000', NULL, '2024-07-03', b'1', 1, 3),
(18, '2024-06-22 15:29:52.000000', NULL, '2024-07-04', b'1', 1, 3),
(19, '2024-06-22 15:29:52.000000', NULL, '2024-07-05', b'1', 1, 3),
(20, '2024-06-22 15:29:52.000000', NULL, '2024-07-06', b'1', 1, 3),
(21, '2024-06-22 15:29:52.000000', NULL, '2024-07-02', b'1', 1, 2),
(22, '2024-06-22 15:29:52.000000', NULL, '2024-07-03', b'1', 1, 2),
(23, '2024-06-22 15:29:52.000000', NULL, '2024-07-04', b'1', 1, 2),
(24, '2024-06-22 15:29:52.000000', NULL, '2024-07-05', b'1', 1, 2),
(25, '2024-06-22 15:29:52.000000', NULL, '2024-07-06', b'1', 1, 2),
(26, '2024-06-22 15:29:52.000000', NULL, '2024-07-02', b'1', 1, 1),
(27, '2024-06-22 15:29:52.000000', NULL, '2024-07-03', b'1', 1, 1),
(28, '2024-06-22 15:29:52.000000', NULL, '2024-07-04', b'1', 1, 1),
(29, '2024-06-22 15:29:52.000000', NULL, '2024-07-05', b'1', 1, 1),
(30, '2024-06-22 15:29:52.000000', NULL, '2024-07-06', b'1', 1, 1),
(31, '2024-06-22 15:29:52.000000', NULL, '2024-07-02', b'1', 2, 6),
(32, '2024-06-22 15:29:52.000000', NULL, '2024-07-03', b'1', 2, 6),
(33, '2024-06-22 15:29:52.000000', NULL, '2024-07-04', b'1', 2, 6),
(34, '2024-06-22 15:29:52.000000', NULL, '2024-07-05', b'1', 2, 6),
(35, '2024-06-22 15:29:52.000000', NULL, '2024-07-06', b'1', 2, 6),
(36, '2024-06-22 15:29:52.000000', NULL, '2024-07-02', b'1', 2, 5),
(37, '2024-06-22 15:29:52.000000', NULL, '2024-07-03', b'1', 2, 5),
(38, '2024-06-22 15:29:52.000000', NULL, '2024-07-04', b'1', 2, 5),
(39, '2024-06-22 15:29:52.000000', NULL, '2024-07-05', b'1', 2, 5),
(40, '2024-06-22 15:29:52.000000', NULL, '2024-07-06', b'1', 2, 5),
(41, '2024-06-22 15:29:52.000000', NULL, '2024-07-02', b'1', 2, 4),
(42, '2024-06-22 15:29:52.000000', NULL, '2024-07-03', b'1', 2, 4),
(43, '2024-06-22 15:29:52.000000', NULL, '2024-07-04', b'1', 2, 4),
(44, '2024-06-22 15:29:52.000000', NULL, '2024-07-05', b'1', 2, 4),
(45, '2024-06-22 15:29:52.000000', NULL, '2024-07-06', b'1', 2, 4),
(46, '2024-06-22 15:29:52.000000', NULL, '2024-07-02', b'1', 2, 3),
(47, '2024-06-22 15:29:52.000000', NULL, '2024-07-03', b'1', 2, 3),
(48, '2024-06-22 15:29:52.000000', NULL, '2024-07-04', b'1', 2, 3),
(49, '2024-06-22 15:29:52.000000', NULL, '2024-07-05', b'1', 2, 3),
(50, '2024-06-22 15:29:52.000000', NULL, '2024-07-06', b'1', 2, 3),
(51, '2024-06-22 15:29:52.000000', NULL, '2024-07-02', b'1', 2, 2),
(52, '2024-06-22 15:29:52.000000', NULL, '2024-07-03', b'1', 2, 2),
(53, '2024-06-22 15:29:52.000000', NULL, '2024-07-04', b'1', 2, 2),
(54, '2024-06-22 15:29:52.000000', NULL, '2024-07-05', b'1', 2, 2),
(55, '2024-06-22 15:29:52.000000', NULL, '2024-07-06', b'1', 2, 2),
(56, '2024-06-22 15:29:52.000000', NULL, '2024-07-02', b'1', 2, 1),
(57, '2024-06-22 15:29:52.000000', NULL, '2024-07-03', b'1', 2, 1),
(58, '2024-06-22 15:29:52.000000', NULL, '2024-07-04', b'1', 2, 1),
(59, '2024-06-22 15:29:52.000000', NULL, '2024-07-05', b'1', 2, 1),
(60, '2024-06-22 15:29:52.000000', NULL, '2024-07-06', b'1', 2, 1),
(61, '2024-06-22 15:29:52.000000', NULL, '2024-07-02', b'1', 3, 6),
(62, '2024-06-22 15:29:52.000000', NULL, '2024-07-03', b'1', 3, 6),
(63, '2024-06-22 15:29:52.000000', NULL, '2024-07-04', b'1', 3, 6),
(64, '2024-06-22 15:29:52.000000', NULL, '2024-07-05', b'1', 3, 6),
(65, '2024-06-22 15:29:52.000000', NULL, '2024-07-06', b'1', 3, 6),
(66, '2024-06-22 15:29:52.000000', NULL, '2024-07-02', b'1', 3, 5),
(67, '2024-06-22 15:29:52.000000', NULL, '2024-07-03', b'1', 3, 5),
(68, '2024-06-22 15:29:52.000000', NULL, '2024-07-04', b'1', 3, 5),
(69, '2024-06-22 15:29:52.000000', NULL, '2024-07-05', b'1', 3, 5),
(70, '2024-06-22 15:29:52.000000', NULL, '2024-07-06', b'1', 3, 5),
(71, '2024-06-22 15:29:52.000000', NULL, '2024-07-02', b'1', 3, 4),
(72, '2024-06-22 15:29:52.000000', NULL, '2024-07-03', b'1', 3, 4),
(73, '2024-06-22 15:29:52.000000', NULL, '2024-07-04', b'1', 3, 4),
(74, '2024-06-22 15:29:52.000000', NULL, '2024-07-05', b'1', 3, 4),
(75, '2024-06-22 15:29:52.000000', NULL, '2024-07-06', b'1', 3, 4),
(76, '2024-06-22 15:29:52.000000', NULL, '2024-07-02', b'1', 3, 3),
(77, '2024-06-22 15:29:52.000000', NULL, '2024-07-03', b'1', 3, 3),
(78, '2024-06-22 15:29:52.000000', NULL, '2024-07-04', b'1', 3, 3),
(79, '2024-06-22 15:29:52.000000', NULL, '2024-07-05', b'1', 3, 3),
(80, '2024-06-22 15:29:52.000000', NULL, '2024-07-06', b'1', 3, 3),
(81, '2024-06-22 15:29:52.000000', NULL, '2024-07-02', b'1', 3, 2),
(82, '2024-06-22 15:29:52.000000', NULL, '2024-07-03', b'1', 3, 2),
(83, '2024-06-22 15:29:52.000000', NULL, '2024-07-04', b'1', 3, 2),
(84, '2024-06-22 15:29:52.000000', NULL, '2024-07-05', b'1', 3, 2),
(85, '2024-06-22 15:29:52.000000', NULL, '2024-07-06', b'1', 3, 2),
(86, '2024-06-22 15:29:52.000000', NULL, '2024-07-02', b'1', 3, 1),
(87, '2024-06-22 15:29:52.000000', NULL, '2024-07-03', b'1', 3, 1),
(88, '2024-06-22 15:29:52.000000', NULL, '2024-07-04', b'1', 3, 1),
(89, '2024-06-22 15:29:52.000000', NULL, '2024-07-05', b'1', 3, 1),
(90, '2024-06-22 15:29:52.000000', NULL, '2024-07-06', b'1', 3, 1),
(91, '2024-06-22 15:29:52.000000', NULL, '2024-07-02', b'1', 4, 6),
(92, '2024-06-22 15:29:52.000000', NULL, '2024-07-03', b'1', 4, 6),
(93, '2024-06-22 15:29:52.000000', NULL, '2024-07-04', b'1', 4, 6),
(94, '2024-06-22 15:29:52.000000', NULL, '2024-07-05', b'1', 4, 6),
(95, '2024-06-22 15:29:52.000000', NULL, '2024-07-06', b'1', 4, 6),
(96, '2024-06-22 15:29:52.000000', NULL, '2024-07-02', b'1', 4, 5),
(97, '2024-06-22 15:29:52.000000', NULL, '2024-07-03', b'1', 4, 5),
(98, '2024-06-22 15:29:52.000000', NULL, '2024-07-04', b'1', 4, 5),
(99, '2024-06-22 15:29:52.000000', NULL, '2024-07-05', b'1', 4, 5),
(100, '2024-06-22 15:29:52.000000', NULL, '2024-07-06', b'1', 4, 5),
(101, '2024-06-22 15:29:52.000000', NULL, '2024-07-02', b'1', 4, 4),
(102, '2024-06-22 15:29:52.000000', NULL, '2024-07-03', b'1', 4, 4),
(103, '2024-06-22 15:29:52.000000', NULL, '2024-07-04', b'1', 4, 4),
(104, '2024-06-22 15:29:52.000000', NULL, '2024-07-05', b'1', 4, 4),
(105, '2024-06-22 15:29:52.000000', NULL, '2024-07-06', b'1', 4, 4),
(106, '2024-06-22 15:29:52.000000', NULL, '2024-07-02', b'1', 4, 3),
(107, '2024-06-22 15:29:52.000000', NULL, '2024-07-03', b'1', 4, 3),
(108, '2024-06-22 15:29:52.000000', NULL, '2024-07-04', b'1', 4, 3),
(109, '2024-06-22 15:29:52.000000', NULL, '2024-07-05', b'1', 4, 3),
(110, '2024-06-22 15:29:52.000000', NULL, '2024-07-06', b'1', 4, 3),
(111, '2024-06-22 15:29:52.000000', NULL, '2024-07-02', b'1', 4, 2),
(112, '2024-06-22 15:29:52.000000', NULL, '2024-07-03', b'1', 4, 2),
(113, '2024-06-22 15:29:52.000000', NULL, '2024-07-04', b'1', 4, 2),
(114, '2024-06-22 15:29:52.000000', NULL, '2024-07-05', b'1', 4, 2),
(115, '2024-06-22 15:29:52.000000', NULL, '2024-07-06', b'1', 4, 2),
(116, '2024-06-22 15:29:52.000000', NULL, '2024-07-02', b'1', 4, 1),
(117, '2024-06-22 15:29:52.000000', NULL, '2024-07-03', b'1', 4, 1),
(118, '2024-06-22 15:29:52.000000', NULL, '2024-07-04', b'1', 4, 1),
(119, '2024-06-22 15:29:52.000000', NULL, '2024-07-05', b'1', 4, 1),
(120, '2024-06-22 15:29:52.000000', NULL, '2024-07-06', b'1', 4, 1),
(121, '2024-06-22 15:29:52.000000', NULL, '2024-07-02', b'1', 5, 6),
(122, '2024-06-22 15:29:52.000000', NULL, '2024-07-03', b'1', 5, 6),
(123, '2024-06-22 15:29:52.000000', NULL, '2024-07-04', b'1', 5, 6),
(124, '2024-06-22 15:29:52.000000', NULL, '2024-07-05', b'1', 5, 6),
(125, '2024-06-22 15:29:52.000000', NULL, '2024-07-06', b'1', 5, 6),
(126, '2024-06-22 15:29:52.000000', NULL, '2024-07-02', b'1', 5, 5),
(127, '2024-06-22 15:29:52.000000', NULL, '2024-07-03', b'1', 5, 5),
(128, '2024-06-22 15:29:52.000000', NULL, '2024-07-04', b'1', 5, 5),
(129, '2024-06-22 15:29:52.000000', NULL, '2024-07-05', b'1', 5, 5),
(130, '2024-06-22 15:29:52.000000', NULL, '2024-07-06', b'1', 5, 5),
(131, '2024-06-22 15:29:52.000000', NULL, '2024-07-02', b'1', 5, 4),
(132, '2024-06-22 15:29:52.000000', NULL, '2024-07-03', b'1', 5, 4),
(133, '2024-06-22 15:29:52.000000', NULL, '2024-07-04', b'1', 5, 4),
(134, '2024-06-22 15:29:52.000000', NULL, '2024-07-05', b'1', 5, 4),
(135, '2024-06-22 15:29:52.000000', NULL, '2024-07-06', b'1', 5, 4),
(136, '2024-06-22 15:29:52.000000', NULL, '2024-07-02', b'1', 5, 3),
(137, '2024-06-22 15:29:52.000000', NULL, '2024-07-03', b'1', 5, 3),
(138, '2024-06-22 15:29:52.000000', NULL, '2024-07-04', b'1', 5, 3),
(139, '2024-06-22 15:29:52.000000', NULL, '2024-07-05', b'1', 5, 3),
(140, '2024-06-22 15:29:52.000000', NULL, '2024-07-06', b'1', 5, 3),
(141, '2024-06-22 15:29:52.000000', NULL, '2024-07-02', b'1', 5, 2),
(142, '2024-06-22 15:29:52.000000', NULL, '2024-07-03', b'1', 5, 2),
(143, '2024-06-22 15:29:52.000000', NULL, '2024-07-04', b'1', 5, 2),
(144, '2024-06-22 15:29:52.000000', NULL, '2024-07-05', b'1', 5, 2),
(145, '2024-06-22 15:29:52.000000', NULL, '2024-07-06', b'1', 5, 2),
(146, '2024-06-22 15:29:52.000000', NULL, '2024-07-02', b'1', 5, 1),
(147, '2024-06-22 15:29:52.000000', NULL, '2024-07-03', b'1', 5, 1),
(148, '2024-06-22 15:29:52.000000', NULL, '2024-07-04', b'1', 5, 1),
(149, '2024-06-22 15:29:52.000000', NULL, '2024-07-05', b'1', 5, 1),
(150, '2024-06-22 15:29:52.000000', NULL, '2024-07-06', b'1', 5, 1),
(151, '2024-06-22 15:29:52.000000', NULL, '2024-07-02', b'1', 6, 6),
(152, '2024-06-22 15:29:52.000000', NULL, '2024-07-03', b'1', 6, 6),
(153, '2024-06-22 15:29:52.000000', NULL, '2024-07-04', b'1', 6, 6),
(154, '2024-06-22 15:29:52.000000', NULL, '2024-07-05', b'1', 6, 6),
(155, '2024-06-22 15:29:52.000000', NULL, '2024-07-06', b'1', 6, 6),
(156, '2024-06-22 15:29:52.000000', NULL, '2024-07-02', b'1', 6, 5),
(157, '2024-06-22 15:29:52.000000', NULL, '2024-07-03', b'1', 6, 5),
(158, '2024-06-22 15:29:52.000000', NULL, '2024-07-04', b'1', 6, 5),
(159, '2024-06-22 15:29:52.000000', NULL, '2024-07-05', b'1', 6, 5),
(160, '2024-06-22 15:29:52.000000', NULL, '2024-07-06', b'1', 6, 5),
(161, '2024-06-22 15:29:52.000000', NULL, '2024-07-02', b'1', 6, 4),
(162, '2024-06-22 15:29:52.000000', NULL, '2024-07-03', b'1', 6, 4),
(163, '2024-06-22 15:29:52.000000', NULL, '2024-07-04', b'1', 6, 4),
(164, '2024-06-22 15:29:52.000000', NULL, '2024-07-05', b'1', 6, 4),
(165, '2024-06-22 15:29:52.000000', NULL, '2024-07-06', b'1', 6, 4),
(166, '2024-06-22 15:29:52.000000', NULL, '2024-07-02', b'1', 6, 3),
(167, '2024-06-22 15:29:52.000000', NULL, '2024-07-03', b'1', 6, 3),
(168, '2024-06-22 15:29:52.000000', NULL, '2024-07-04', b'1', 6, 3),
(169, '2024-06-22 15:29:52.000000', NULL, '2024-07-05', b'1', 6, 3),
(170, '2024-06-22 15:29:52.000000', NULL, '2024-07-06', b'1', 6, 3),
(171, '2024-06-22 15:29:52.000000', NULL, '2024-07-02', b'1', 6, 2),
(172, '2024-06-22 15:29:52.000000', NULL, '2024-07-03', b'1', 6, 2),
(173, '2024-06-22 15:29:52.000000', NULL, '2024-07-04', b'1', 6, 2),
(174, '2024-06-22 15:29:52.000000', NULL, '2024-07-05', b'1', 6, 2),
(175, '2024-06-22 15:29:52.000000', NULL, '2024-07-06', b'1', 6, 2),
(176, '2024-06-22 15:29:52.000000', NULL, '2024-07-02', b'1', 6, 1),
(177, '2024-06-22 15:29:52.000000', NULL, '2024-07-03', b'1', 6, 1),
(178, '2024-06-22 15:29:52.000000', NULL, '2024-07-04', b'1', 6, 1),
(179, '2024-06-22 15:29:52.000000', NULL, '2024-07-05', b'1', 6, 1),
(180, '2024-06-22 15:29:52.000000', NULL, '2024-07-06', b'1', 6, 1),
(181, '2024-06-22 15:29:52.000000', NULL, '2024-07-02', b'1', 7, 6),
(182, '2024-06-22 15:29:52.000000', NULL, '2024-07-03', b'1', 7, 6),
(183, '2024-06-22 15:29:52.000000', NULL, '2024-07-04', b'1', 7, 6),
(184, '2024-06-22 15:29:52.000000', NULL, '2024-07-05', b'1', 7, 6),
(185, '2024-06-22 15:29:52.000000', NULL, '2024-07-06', b'1', 7, 6),
(186, '2024-06-22 15:29:52.000000', NULL, '2024-07-02', b'1', 7, 5),
(187, '2024-06-22 15:29:52.000000', NULL, '2024-07-03', b'1', 7, 5),
(188, '2024-06-22 15:29:52.000000', NULL, '2024-07-04', b'1', 7, 5),
(189, '2024-06-22 15:29:52.000000', NULL, '2024-07-05', b'1', 7, 5),
(190, '2024-06-22 15:29:52.000000', NULL, '2024-07-06', b'1', 7, 5),
(191, '2024-06-22 15:29:52.000000', NULL, '2024-07-02', b'1', 7, 4),
(192, '2024-06-22 15:29:52.000000', NULL, '2024-07-03', b'1', 7, 4),
(193, '2024-06-22 15:29:52.000000', NULL, '2024-07-04', b'1', 7, 4),
(194, '2024-06-22 15:29:52.000000', NULL, '2024-07-05', b'1', 7, 4),
(195, '2024-06-22 15:29:52.000000', NULL, '2024-07-06', b'1', 7, 4),
(196, '2024-06-22 15:29:52.000000', NULL, '2024-07-02', b'1', 7, 3),
(197, '2024-06-22 15:29:52.000000', NULL, '2024-07-03', b'1', 7, 3),
(198, '2024-06-22 15:29:52.000000', NULL, '2024-07-04', b'1', 7, 3),
(199, '2024-06-22 15:29:52.000000', NULL, '2024-07-05', b'1', 7, 3),
(200, '2024-06-22 15:29:52.000000', NULL, '2024-07-06', b'1', 7, 3),
(201, '2024-06-22 15:29:52.000000', NULL, '2024-07-02', b'1', 7, 2),
(202, '2024-06-22 15:29:52.000000', NULL, '2024-07-03', b'1', 7, 2),
(203, '2024-06-22 15:29:52.000000', NULL, '2024-07-04', b'1', 7, 2),
(204, '2024-06-22 15:29:52.000000', NULL, '2024-07-05', b'1', 7, 2),
(205, '2024-06-22 15:29:52.000000', NULL, '2024-07-06', b'1', 7, 2),
(206, '2024-06-22 15:29:52.000000', NULL, '2024-07-02', b'1', 7, 1),
(207, '2024-06-22 15:29:52.000000', NULL, '2024-07-03', b'1', 7, 1),
(208, '2024-06-22 15:29:52.000000', NULL, '2024-07-04', b'1', 7, 1),
(209, '2024-06-22 15:29:52.000000', NULL, '2024-07-05', b'1', 7, 1),
(210, '2024-06-22 15:29:52.000000', NULL, '2024-07-06', b'1', 7, 1),
(256, '2024-06-22 15:30:17.000000', NULL, '2024-06-27', b'1', 1, 6),
(257, '2024-06-22 15:30:17.000000', NULL, '2024-06-28', b'1', 1, 6),
(258, '2024-06-22 15:30:17.000000', NULL, '2024-06-29', b'1', 1, 6),
(259, '2024-06-22 15:30:17.000000', NULL, '2024-06-30', b'1', 1, 6),
(260, '2024-06-22 15:30:17.000000', NULL, '2024-07-01', b'1', 1, 6),
(261, '2024-06-22 15:30:17.000000', NULL, '2024-06-27', b'1', 1, 5),
(262, '2024-06-22 15:30:17.000000', NULL, '2024-06-28', b'1', 1, 5),
(263, '2024-06-22 15:30:17.000000', NULL, '2024-06-29', b'1', 1, 5),
(264, '2024-06-22 15:30:17.000000', NULL, '2024-06-30', b'1', 1, 5),
(265, '2024-06-22 15:30:17.000000', NULL, '2024-07-01', b'1', 1, 5),
(266, '2024-06-22 15:30:17.000000', NULL, '2024-06-27', b'1', 1, 4),
(267, '2024-06-22 15:30:17.000000', NULL, '2024-06-28', b'1', 1, 4),
(268, '2024-06-22 15:30:17.000000', NULL, '2024-06-29', b'1', 1, 4),
(269, '2024-06-22 15:30:17.000000', NULL, '2024-06-30', b'1', 1, 4),
(270, '2024-06-22 15:30:17.000000', NULL, '2024-07-01', b'1', 1, 4),
(271, '2024-06-22 15:30:17.000000', NULL, '2024-06-27', b'1', 1, 3),
(272, '2024-06-22 15:30:17.000000', NULL, '2024-06-28', b'1', 1, 3),
(273, '2024-06-22 15:30:17.000000', NULL, '2024-06-29', b'1', 1, 3),
(274, '2024-06-22 15:30:17.000000', NULL, '2024-06-30', b'1', 1, 3),
(275, '2024-06-22 15:30:17.000000', NULL, '2024-07-01', b'1', 1, 3),
(276, '2024-06-22 15:30:17.000000', NULL, '2024-06-27', b'1', 1, 2),
(277, '2024-06-22 15:30:17.000000', NULL, '2024-06-28', b'1', 1, 2),
(278, '2024-06-22 15:30:17.000000', NULL, '2024-06-29', b'1', 1, 2),
(279, '2024-06-22 15:30:17.000000', NULL, '2024-06-30', b'1', 1, 2),
(280, '2024-06-22 15:30:17.000000', NULL, '2024-07-01', b'1', 1, 2),
(281, '2024-06-22 15:30:17.000000', NULL, '2024-06-27', b'1', 1, 1),
(282, '2024-06-22 15:30:17.000000', NULL, '2024-06-28', b'1', 1, 1),
(283, '2024-06-22 15:30:17.000000', NULL, '2024-06-29', b'1', 1, 1),
(284, '2024-06-22 15:30:17.000000', NULL, '2024-06-30', b'1', 1, 1),
(285, '2024-06-22 15:30:17.000000', NULL, '2024-07-01', b'1', 1, 1),
(286, '2024-06-22 15:30:17.000000', NULL, '2024-06-27', b'1', 2, 6),
(287, '2024-06-22 15:30:17.000000', NULL, '2024-06-28', b'1', 2, 6),
(288, '2024-06-22 15:30:17.000000', NULL, '2024-06-29', b'1', 2, 6),
(289, '2024-06-22 15:30:17.000000', NULL, '2024-06-30', b'1', 2, 6),
(290, '2024-06-22 15:30:17.000000', NULL, '2024-07-01', b'1', 2, 6),
(291, '2024-06-22 15:30:17.000000', NULL, '2024-06-27', b'1', 2, 5),
(292, '2024-06-22 15:30:17.000000', NULL, '2024-06-28', b'1', 2, 5),
(293, '2024-06-22 15:30:17.000000', NULL, '2024-06-29', b'1', 2, 5),
(294, '2024-06-22 15:30:17.000000', NULL, '2024-06-30', b'1', 2, 5),
(295, '2024-06-22 15:30:17.000000', NULL, '2024-07-01', b'1', 2, 5),
(296, '2024-06-22 15:30:17.000000', NULL, '2024-06-27', b'1', 2, 4),
(297, '2024-06-22 15:30:17.000000', NULL, '2024-06-28', b'1', 2, 4),
(298, '2024-06-22 15:30:17.000000', NULL, '2024-06-29', b'1', 2, 4),
(299, '2024-06-22 15:30:17.000000', NULL, '2024-06-30', b'1', 2, 4),
(300, '2024-06-22 15:30:17.000000', NULL, '2024-07-01', b'1', 2, 4),
(301, '2024-06-22 15:30:17.000000', NULL, '2024-06-27', b'1', 2, 3),
(302, '2024-06-22 15:30:17.000000', NULL, '2024-06-28', b'1', 2, 3),
(303, '2024-06-22 15:30:17.000000', NULL, '2024-06-29', b'1', 2, 3),
(304, '2024-06-22 15:30:17.000000', NULL, '2024-06-30', b'1', 2, 3),
(305, '2024-06-22 15:30:17.000000', NULL, '2024-07-01', b'1', 2, 3),
(306, '2024-06-22 15:30:17.000000', NULL, '2024-06-27', b'1', 2, 2),
(307, '2024-06-22 15:30:17.000000', NULL, '2024-06-28', b'1', 2, 2),
(308, '2024-06-22 15:30:17.000000', NULL, '2024-06-29', b'1', 2, 2),
(309, '2024-06-22 15:30:17.000000', NULL, '2024-06-30', b'1', 2, 2),
(310, '2024-06-22 15:30:17.000000', NULL, '2024-07-01', b'1', 2, 2),
(311, '2024-06-22 15:30:17.000000', NULL, '2024-06-27', b'1', 2, 1),
(312, '2024-06-22 15:30:17.000000', NULL, '2024-06-28', b'1', 2, 1),
(313, '2024-06-22 15:30:17.000000', NULL, '2024-06-29', b'1', 2, 1),
(314, '2024-06-22 15:30:17.000000', NULL, '2024-06-30', b'1', 2, 1),
(315, '2024-06-22 15:30:17.000000', NULL, '2024-07-01', b'1', 2, 1),
(316, '2024-06-22 15:30:17.000000', NULL, '2024-06-27', b'1', 3, 6),
(317, '2024-06-22 15:30:17.000000', NULL, '2024-06-28', b'1', 3, 6),
(318, '2024-06-22 15:30:17.000000', NULL, '2024-06-29', b'1', 3, 6),
(319, '2024-06-22 15:30:17.000000', NULL, '2024-06-30', b'1', 3, 6),
(320, '2024-06-22 15:30:17.000000', NULL, '2024-07-01', b'1', 3, 6),
(321, '2024-06-22 15:30:17.000000', NULL, '2024-06-27', b'1', 3, 5),
(322, '2024-06-22 15:30:17.000000', NULL, '2024-06-28', b'1', 3, 5),
(323, '2024-06-22 15:30:17.000000', NULL, '2024-06-29', b'1', 3, 5),
(324, '2024-06-22 15:30:17.000000', NULL, '2024-06-30', b'1', 3, 5),
(325, '2024-06-22 15:30:17.000000', NULL, '2024-07-01', b'1', 3, 5),
(326, '2024-06-22 15:30:17.000000', NULL, '2024-06-27', b'1', 3, 4),
(327, '2024-06-22 15:30:17.000000', NULL, '2024-06-28', b'1', 3, 4),
(328, '2024-06-22 15:30:17.000000', NULL, '2024-06-29', b'1', 3, 4),
(329, '2024-06-22 15:30:17.000000', NULL, '2024-06-30', b'1', 3, 4),
(330, '2024-06-22 15:30:17.000000', NULL, '2024-07-01', b'1', 3, 4),
(331, '2024-06-22 15:30:17.000000', NULL, '2024-06-27', b'1', 3, 3),
(332, '2024-06-22 15:30:17.000000', NULL, '2024-06-28', b'1', 3, 3),
(333, '2024-06-22 15:30:17.000000', NULL, '2024-06-29', b'1', 3, 3),
(334, '2024-06-22 15:30:17.000000', NULL, '2024-06-30', b'1', 3, 3),
(335, '2024-06-22 15:30:17.000000', NULL, '2024-07-01', b'1', 3, 3),
(336, '2024-06-22 15:30:17.000000', NULL, '2024-06-27', b'1', 3, 2),
(337, '2024-06-22 15:30:17.000000', NULL, '2024-06-28', b'1', 3, 2),
(338, '2024-06-22 15:30:17.000000', NULL, '2024-06-29', b'1', 3, 2),
(339, '2024-06-22 15:30:17.000000', NULL, '2024-06-30', b'1', 3, 2),
(340, '2024-06-22 15:30:17.000000', NULL, '2024-07-01', b'1', 3, 2),
(341, '2024-06-22 15:30:17.000000', NULL, '2024-06-27', b'1', 3, 1),
(342, '2024-06-22 15:30:17.000000', NULL, '2024-06-28', b'1', 3, 1),
(343, '2024-06-22 15:30:17.000000', NULL, '2024-06-29', b'1', 3, 1),
(344, '2024-06-22 15:30:17.000000', NULL, '2024-06-30', b'1', 3, 1),
(345, '2024-06-22 15:30:17.000000', NULL, '2024-07-01', b'1', 3, 1),
(346, '2024-06-22 15:30:17.000000', NULL, '2024-06-27', b'1', 4, 6),
(347, '2024-06-22 15:30:17.000000', NULL, '2024-06-28', b'1', 4, 6),
(348, '2024-06-22 15:30:17.000000', NULL, '2024-06-29', b'1', 4, 6),
(349, '2024-06-22 15:30:17.000000', NULL, '2024-06-30', b'1', 4, 6),
(350, '2024-06-22 15:30:17.000000', NULL, '2024-07-01', b'1', 4, 6),
(351, '2024-06-22 15:30:17.000000', NULL, '2024-06-27', b'1', 4, 5),
(352, '2024-06-22 15:30:17.000000', NULL, '2024-06-28', b'1', 4, 5),
(353, '2024-06-22 15:30:17.000000', NULL, '2024-06-29', b'1', 4, 5),
(354, '2024-06-22 15:30:17.000000', NULL, '2024-06-30', b'1', 4, 5),
(355, '2024-06-22 15:30:17.000000', NULL, '2024-07-01', b'1', 4, 5),
(356, '2024-06-22 15:30:17.000000', NULL, '2024-06-27', b'1', 4, 4),
(357, '2024-06-22 15:30:17.000000', NULL, '2024-06-28', b'1', 4, 4),
(358, '2024-06-22 15:30:17.000000', NULL, '2024-06-29', b'1', 4, 4),
(359, '2024-06-22 15:30:17.000000', NULL, '2024-06-30', b'1', 4, 4),
(360, '2024-06-22 15:30:17.000000', NULL, '2024-07-01', b'1', 4, 4),
(361, '2024-06-22 15:30:17.000000', NULL, '2024-06-27', b'1', 4, 3),
(362, '2024-06-22 15:30:17.000000', NULL, '2024-06-28', b'1', 4, 3),
(363, '2024-06-22 15:30:17.000000', NULL, '2024-06-29', b'1', 4, 3),
(364, '2024-06-22 15:30:17.000000', NULL, '2024-06-30', b'1', 4, 3),
(365, '2024-06-22 15:30:17.000000', NULL, '2024-07-01', b'1', 4, 3),
(366, '2024-06-22 15:30:17.000000', NULL, '2024-06-27', b'1', 4, 2),
(367, '2024-06-22 15:30:17.000000', NULL, '2024-06-28', b'1', 4, 2),
(368, '2024-06-22 15:30:17.000000', NULL, '2024-06-29', b'1', 4, 2),
(369, '2024-06-22 15:30:17.000000', NULL, '2024-06-30', b'1', 4, 2),
(370, '2024-06-22 15:30:17.000000', NULL, '2024-07-01', b'1', 4, 2),
(371, '2024-06-22 15:30:17.000000', NULL, '2024-06-27', b'1', 4, 1),
(372, '2024-06-22 15:30:17.000000', NULL, '2024-06-28', b'1', 4, 1),
(373, '2024-06-22 15:30:17.000000', NULL, '2024-06-29', b'1', 4, 1),
(374, '2024-06-22 15:30:17.000000', NULL, '2024-06-30', b'1', 4, 1),
(375, '2024-06-22 15:30:17.000000', NULL, '2024-07-01', b'1', 4, 1),
(376, '2024-06-22 15:30:17.000000', NULL, '2024-06-27', b'1', 5, 6),
(377, '2024-06-22 15:30:17.000000', NULL, '2024-06-28', b'1', 5, 6),
(378, '2024-06-22 15:30:17.000000', NULL, '2024-06-29', b'1', 5, 6),
(379, '2024-06-22 15:30:17.000000', NULL, '2024-06-30', b'1', 5, 6),
(380, '2024-06-22 15:30:17.000000', NULL, '2024-07-01', b'1', 5, 6),
(381, '2024-06-22 15:30:17.000000', NULL, '2024-06-27', b'1', 5, 5),
(382, '2024-06-22 15:30:17.000000', NULL, '2024-06-28', b'1', 5, 5),
(383, '2024-06-22 15:30:17.000000', NULL, '2024-06-29', b'1', 5, 5),
(384, '2024-06-22 15:30:17.000000', NULL, '2024-06-30', b'1', 5, 5),
(385, '2024-06-22 15:30:17.000000', NULL, '2024-07-01', b'1', 5, 5),
(386, '2024-06-22 15:30:17.000000', NULL, '2024-06-27', b'1', 5, 4),
(387, '2024-06-22 15:30:17.000000', NULL, '2024-06-28', b'1', 5, 4),
(388, '2024-06-22 15:30:17.000000', NULL, '2024-06-29', b'1', 5, 4),
(389, '2024-06-22 15:30:17.000000', NULL, '2024-06-30', b'1', 5, 4),
(390, '2024-06-22 15:30:17.000000', NULL, '2024-07-01', b'1', 5, 4),
(391, '2024-06-22 15:30:17.000000', NULL, '2024-06-27', b'1', 5, 3),
(392, '2024-06-22 15:30:17.000000', NULL, '2024-06-28', b'1', 5, 3),
(393, '2024-06-22 15:30:17.000000', NULL, '2024-06-29', b'1', 5, 3),
(394, '2024-06-22 15:30:17.000000', NULL, '2024-06-30', b'1', 5, 3),
(395, '2024-06-22 15:30:17.000000', NULL, '2024-07-01', b'1', 5, 3),
(396, '2024-06-22 15:30:17.000000', NULL, '2024-06-27', b'1', 5, 2),
(397, '2024-06-22 15:30:17.000000', NULL, '2024-06-28', b'1', 5, 2),
(398, '2024-06-22 15:30:17.000000', NULL, '2024-06-29', b'1', 5, 2),
(399, '2024-06-22 15:30:17.000000', NULL, '2024-06-30', b'1', 5, 2),
(400, '2024-06-22 15:30:17.000000', NULL, '2024-07-01', b'1', 5, 2),
(401, '2024-06-22 15:30:17.000000', NULL, '2024-06-27', b'1', 5, 1),
(402, '2024-06-22 15:30:17.000000', NULL, '2024-06-28', b'1', 5, 1),
(403, '2024-06-22 15:30:17.000000', NULL, '2024-06-29', b'1', 5, 1),
(404, '2024-06-22 15:30:17.000000', NULL, '2024-06-30', b'1', 5, 1),
(405, '2024-06-22 15:30:17.000000', NULL, '2024-07-01', b'1', 5, 1),
(406, '2024-06-22 15:30:17.000000', NULL, '2024-06-27', b'1', 6, 6),
(407, '2024-06-22 15:30:17.000000', NULL, '2024-06-28', b'1', 6, 6),
(408, '2024-06-22 15:30:17.000000', NULL, '2024-06-29', b'1', 6, 6),
(409, '2024-06-22 15:30:17.000000', NULL, '2024-06-30', b'1', 6, 6),
(410, '2024-06-22 15:30:17.000000', NULL, '2024-07-01', b'1', 6, 6),
(411, '2024-06-22 15:30:17.000000', NULL, '2024-06-27', b'1', 6, 5),
(412, '2024-06-22 15:30:17.000000', NULL, '2024-06-28', b'1', 6, 5),
(413, '2024-06-22 15:30:17.000000', NULL, '2024-06-29', b'1', 6, 5),
(414, '2024-06-22 15:30:17.000000', NULL, '2024-06-30', b'1', 6, 5),
(415, '2024-06-22 15:30:17.000000', NULL, '2024-07-01', b'1', 6, 5),
(416, '2024-06-22 15:30:17.000000', NULL, '2024-06-27', b'1', 6, 4),
(417, '2024-06-22 15:30:17.000000', NULL, '2024-06-28', b'1', 6, 4),
(418, '2024-06-22 15:30:17.000000', NULL, '2024-06-29', b'1', 6, 4),
(419, '2024-06-22 15:30:17.000000', NULL, '2024-06-30', b'1', 6, 4),
(420, '2024-06-22 15:30:17.000000', NULL, '2024-07-01', b'1', 6, 4),
(421, '2024-06-22 15:30:17.000000', NULL, '2024-06-27', b'1', 6, 3),
(422, '2024-06-22 15:30:17.000000', NULL, '2024-06-28', b'1', 6, 3),
(423, '2024-06-22 15:30:17.000000', NULL, '2024-06-29', b'1', 6, 3),
(424, '2024-06-22 15:30:17.000000', NULL, '2024-06-30', b'1', 6, 3),
(425, '2024-06-22 15:30:17.000000', NULL, '2024-07-01', b'1', 6, 3),
(426, '2024-06-22 15:30:17.000000', NULL, '2024-06-27', b'1', 6, 2),
(427, '2024-06-22 15:30:17.000000', NULL, '2024-06-28', b'1', 6, 2),
(428, '2024-06-22 15:30:17.000000', NULL, '2024-06-29', b'1', 6, 2),
(429, '2024-06-22 15:30:17.000000', NULL, '2024-06-30', b'1', 6, 2),
(430, '2024-06-22 15:30:17.000000', NULL, '2024-07-01', b'1', 6, 2),
(431, '2024-06-22 15:30:17.000000', NULL, '2024-06-27', b'1', 6, 1),
(432, '2024-06-22 15:30:17.000000', NULL, '2024-06-28', b'1', 6, 1),
(433, '2024-06-22 15:30:17.000000', NULL, '2024-06-29', b'1', 6, 1),
(434, '2024-06-22 15:30:17.000000', NULL, '2024-06-30', b'1', 6, 1),
(435, '2024-06-22 15:30:17.000000', NULL, '2024-07-01', b'1', 6, 1),
(436, '2024-06-22 15:30:17.000000', NULL, '2024-06-27', b'1', 7, 6),
(437, '2024-06-22 15:30:17.000000', NULL, '2024-06-28', b'1', 7, 6),
(438, '2024-06-22 15:30:17.000000', NULL, '2024-06-29', b'1', 7, 6),
(439, '2024-06-22 15:30:17.000000', NULL, '2024-06-30', b'1', 7, 6),
(440, '2024-06-22 15:30:17.000000', NULL, '2024-07-01', b'1', 7, 6),
(441, '2024-06-22 15:30:17.000000', NULL, '2024-06-27', b'1', 7, 5),
(442, '2024-06-22 15:30:17.000000', NULL, '2024-06-28', b'1', 7, 5),
(443, '2024-06-22 15:30:17.000000', NULL, '2024-06-29', b'1', 7, 5),
(444, '2024-06-22 15:30:17.000000', NULL, '2024-06-30', b'1', 7, 5),
(445, '2024-06-22 15:30:17.000000', NULL, '2024-07-01', b'1', 7, 5),
(446, '2024-06-22 15:30:17.000000', NULL, '2024-06-27', b'1', 7, 4),
(447, '2024-06-22 15:30:17.000000', NULL, '2024-06-28', b'1', 7, 4),
(448, '2024-06-22 15:30:17.000000', NULL, '2024-06-29', b'1', 7, 4),
(449, '2024-06-22 15:30:17.000000', NULL, '2024-06-30', b'1', 7, 4),
(450, '2024-06-22 15:30:17.000000', NULL, '2024-07-01', b'1', 7, 4),
(451, '2024-06-22 15:30:17.000000', NULL, '2024-06-27', b'1', 7, 3),
(452, '2024-06-22 15:30:17.000000', NULL, '2024-06-28', b'1', 7, 3),
(453, '2024-06-22 15:30:17.000000', NULL, '2024-06-29', b'1', 7, 3),
(454, '2024-06-22 15:30:17.000000', NULL, '2024-06-30', b'1', 7, 3),
(455, '2024-06-22 15:30:17.000000', NULL, '2024-07-01', b'1', 7, 3),
(456, '2024-06-22 15:30:17.000000', NULL, '2024-06-27', b'1', 7, 2),
(457, '2024-06-22 15:30:17.000000', NULL, '2024-06-28', b'1', 7, 2),
(458, '2024-06-22 15:30:17.000000', NULL, '2024-06-29', b'1', 7, 2),
(459, '2024-06-22 15:30:17.000000', NULL, '2024-06-30', b'1', 7, 2),
(460, '2024-06-22 15:30:17.000000', NULL, '2024-07-01', b'1', 7, 2),
(461, '2024-06-22 15:30:17.000000', NULL, '2024-06-27', b'1', 7, 1),
(462, '2024-06-22 15:30:17.000000', NULL, '2024-06-28', b'1', 7, 1),
(463, '2024-06-22 15:30:17.000000', NULL, '2024-06-29', b'1', 7, 1),
(464, '2024-06-22 15:30:17.000000', NULL, '2024-06-30', b'1', 7, 1),
(465, '2024-06-22 15:30:17.000000', NULL, '2024-07-01', b'1', 7, 1),
(511, '2024-06-22 15:43:24.000000', NULL, '2024-06-23', b'1', 1, 1),
(512, '2024-06-22 15:43:24.000000', NULL, '2024-06-23', b'1', 1, 2),
(513, '2024-06-22 15:43:24.000000', NULL, '2024-06-23', b'1', 1, 3),
(514, '2024-06-22 15:43:24.000000', NULL, '2024-06-23', b'1', 1, 4),
(515, '2024-06-22 15:43:24.000000', NULL, '2024-06-23', b'1', 1, 5),
(516, '2024-06-22 15:43:24.000000', NULL, '2024-06-23', b'1', 1, 6),
(517, '2024-06-22 15:43:28.000000', NULL, '2024-06-23', b'1', 2, 1),
(518, '2024-06-22 15:43:28.000000', NULL, '2024-06-23', b'1', 2, 2),
(519, '2024-06-22 15:43:28.000000', NULL, '2024-06-23', b'1', 2, 3),
(520, '2024-06-22 15:43:28.000000', NULL, '2024-06-23', b'1', 2, 4),
(521, '2024-06-22 15:43:28.000000', NULL, '2024-06-23', b'1', 2, 5),
(522, '2024-06-22 15:43:28.000000', NULL, '2024-06-23', b'1', 2, 6),
(523, '2024-06-22 15:43:31.000000', NULL, '2024-06-23', b'1', 3, 1),
(524, '2024-06-22 15:43:31.000000', NULL, '2024-06-23', b'1', 3, 2),
(525, '2024-06-22 15:43:31.000000', NULL, '2024-06-23', b'1', 3, 3),
(526, '2024-06-22 15:43:31.000000', NULL, '2024-06-23', b'1', 3, 4),
(527, '2024-06-22 15:43:31.000000', NULL, '2024-06-23', b'1', 3, 5),
(528, '2024-06-22 15:43:31.000000', NULL, '2024-06-23', b'1', 3, 6),
(529, '2024-06-22 15:43:34.000000', NULL, '2024-06-23', b'1', 4, 1),
(530, '2024-06-22 15:43:34.000000', NULL, '2024-06-23', b'1', 4, 2),
(531, '2024-06-22 15:43:34.000000', NULL, '2024-06-23', b'1', 4, 3),
(532, '2024-06-22 15:43:34.000000', NULL, '2024-06-23', b'1', 4, 4),
(533, '2024-06-22 15:43:34.000000', NULL, '2024-06-23', b'1', 4, 5),
(534, '2024-06-22 15:43:34.000000', NULL, '2024-06-23', b'1', 4, 6),
(535, '2024-06-22 15:43:37.000000', NULL, '2024-06-23', b'1', 5, 1),
(536, '2024-06-22 15:43:37.000000', NULL, '2024-06-23', b'1', 5, 2),
(537, '2024-06-22 15:43:37.000000', NULL, '2024-06-23', b'1', 5, 3),
(538, '2024-06-22 15:43:37.000000', NULL, '2024-06-23', b'1', 5, 4),
(539, '2024-06-22 15:43:37.000000', NULL, '2024-06-23', b'1', 5, 5),
(540, '2024-06-22 15:43:37.000000', NULL, '2024-06-23', b'1', 5, 6),
(541, '2024-06-22 15:43:40.000000', NULL, '2024-06-23', b'1', 6, 1),
(542, '2024-06-22 15:43:40.000000', NULL, '2024-06-23', b'1', 6, 2),
(543, '2024-06-22 15:43:40.000000', NULL, '2024-06-23', b'1', 6, 3),
(544, '2024-06-22 15:43:40.000000', NULL, '2024-06-23', b'1', 6, 4),
(545, '2024-06-22 15:43:40.000000', NULL, '2024-06-23', b'1', 6, 5),
(546, '2024-06-22 15:43:40.000000', NULL, '2024-06-23', b'1', 6, 6),
(547, '2024-06-22 15:43:43.000000', NULL, '2024-06-23', b'1', 7, 1),
(548, '2024-06-22 15:43:43.000000', NULL, '2024-06-23', b'1', 7, 2),
(549, '2024-06-22 15:43:43.000000', NULL, '2024-06-23', b'1', 7, 3),
(550, '2024-06-22 15:43:43.000000', NULL, '2024-06-23', b'1', 7, 4),
(551, '2024-06-22 15:43:43.000000', NULL, '2024-06-23', b'1', 7, 5),
(552, '2024-06-22 15:43:43.000000', NULL, '2024-06-23', b'1', 7, 6),
(554, '2024-06-22 20:23:11.000000', NULL, '2024-06-24', b'1', 2, 1),
(555, '2024-06-22 20:23:11.000000', NULL, '2024-06-24', b'1', 2, 2),
(556, '2024-06-22 20:23:11.000000', NULL, '2024-06-24', b'1', 2, 3),
(557, '2024-06-22 20:23:11.000000', NULL, '2024-06-24', b'1', 2, 4),
(558, '2024-06-22 20:23:11.000000', NULL, '2024-06-24', b'1', 2, 5),
(559, '2024-06-22 20:23:11.000000', NULL, '2024-06-24', b'1', 2, 6),
(560, '2024-06-22 20:24:19.000000', NULL, '2024-06-25', b'1', 2, 1),
(561, '2024-06-22 20:24:19.000000', NULL, '2024-06-25', b'1', 2, 2),
(562, '2024-06-22 20:24:19.000000', NULL, '2024-06-25', b'1', 2, 3),
(563, '2024-06-22 20:24:19.000000', NULL, '2024-06-25', b'1', 2, 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `schedules_doctors`
--

CREATE TABLE `schedules_doctors` (
  `id` int(11) NOT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `schedule_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `schedules_doctors`
--

INSERT INTO `schedules_doctors` (`id`, `doctor_id`, `schedule_id`) VALUES
(1, 1, 26),
(2, 8, 26),
(3, 15, 26),
(4, 1, 21),
(5, 8, 21),
(6, 15, 21),
(7, 1, 16),
(8, 8, 16),
(9, 15, 16),
(10, 15, 11),
(11, 22, 11),
(12, 29, 11),
(13, 15, 6),
(14, 22, 6),
(15, 29, 6),
(16, 15, 1),
(17, 22, 1),
(18, 29, 1),
(19, 1, 27),
(20, 8, 27),
(21, 15, 27),
(22, 1, 22),
(23, 8, 22),
(24, 15, 22),
(25, 1, 17),
(26, 8, 17),
(27, 15, 17),
(28, 15, 12),
(29, 22, 12),
(30, 29, 12),
(31, 15, 7),
(32, 22, 7),
(33, 29, 7),
(34, 15, 2),
(35, 22, 2),
(36, 29, 2),
(37, 1, 28),
(38, 8, 28),
(39, 15, 28),
(40, 1, 23),
(41, 8, 23),
(42, 15, 23),
(43, 1, 18),
(44, 8, 18),
(45, 15, 18),
(46, 15, 13),
(47, 22, 13),
(48, 29, 13),
(49, 15, 8),
(50, 22, 8),
(51, 29, 8),
(52, 15, 3),
(53, 22, 3),
(54, 29, 3),
(55, 1, 29),
(56, 8, 29),
(57, 15, 29),
(58, 1, 24),
(59, 8, 24),
(60, 15, 24),
(61, 1, 19),
(62, 8, 19),
(63, 15, 19),
(64, 15, 14),
(65, 22, 14),
(66, 29, 14),
(67, 15, 9),
(68, 22, 9),
(69, 29, 9),
(70, 15, 4),
(71, 22, 4),
(72, 29, 4),
(73, 1, 30),
(74, 8, 30),
(75, 15, 30),
(76, 1, 25),
(77, 8, 25),
(78, 15, 25),
(79, 1, 20),
(80, 8, 20),
(81, 15, 20),
(82, 15, 15),
(83, 22, 15),
(84, 29, 15),
(85, 15, 10),
(86, 22, 10),
(87, 29, 10),
(88, 15, 5),
(89, 22, 5),
(90, 29, 5),
(91, 2, 56),
(92, 9, 56),
(93, 16, 56),
(94, 2, 51),
(95, 9, 51),
(96, 16, 51),
(97, 2, 46),
(98, 9, 46),
(99, 16, 46),
(100, 16, 41),
(101, 23, 41),
(102, 30, 41),
(103, 16, 36),
(104, 23, 36),
(105, 30, 36),
(106, 16, 31),
(107, 23, 31),
(108, 30, 31),
(109, 2, 57),
(110, 9, 57),
(111, 16, 57),
(112, 2, 52),
(113, 9, 52),
(114, 16, 52),
(115, 2, 47),
(116, 9, 47),
(117, 16, 47),
(118, 16, 42),
(119, 23, 42),
(120, 30, 42),
(121, 16, 37),
(122, 23, 37),
(123, 30, 37),
(124, 16, 32),
(125, 23, 32),
(126, 30, 32),
(127, 2, 58),
(128, 9, 58),
(129, 16, 58),
(130, 2, 53),
(131, 9, 53),
(132, 16, 53),
(133, 2, 48),
(134, 9, 48),
(135, 16, 48),
(136, 16, 43),
(137, 23, 43),
(138, 30, 43),
(139, 16, 38),
(140, 23, 38),
(141, 30, 38),
(142, 16, 33),
(143, 23, 33),
(144, 30, 33),
(145, 2, 59),
(146, 9, 59),
(147, 16, 59),
(148, 2, 54),
(149, 9, 54),
(150, 16, 54),
(151, 2, 49),
(152, 9, 49),
(153, 16, 49),
(154, 16, 44),
(155, 23, 44),
(156, 30, 44),
(157, 16, 39),
(158, 23, 39),
(159, 30, 39),
(160, 16, 34),
(161, 23, 34),
(162, 30, 34),
(163, 2, 60),
(164, 9, 60),
(165, 16, 60),
(166, 2, 55),
(167, 9, 55),
(168, 16, 55),
(169, 2, 50),
(170, 9, 50),
(171, 16, 50),
(172, 16, 45),
(173, 23, 45),
(174, 30, 45),
(175, 16, 40),
(176, 23, 40),
(177, 30, 40),
(178, 16, 35),
(179, 23, 35),
(180, 30, 35),
(181, 3, 86),
(182, 10, 86),
(183, 17, 86),
(184, 3, 81),
(185, 10, 81),
(186, 17, 81),
(187, 3, 76),
(188, 10, 76),
(189, 17, 76),
(190, 17, 71),
(191, 24, 71),
(192, 31, 71),
(193, 17, 66),
(194, 24, 66),
(195, 31, 66),
(196, 17, 61),
(197, 24, 61),
(198, 31, 61),
(199, 3, 87),
(200, 10, 87),
(201, 17, 87),
(202, 3, 82),
(203, 10, 82),
(204, 17, 82),
(205, 3, 77),
(206, 10, 77),
(207, 17, 77),
(208, 17, 72),
(209, 24, 72),
(210, 31, 72),
(211, 17, 67),
(212, 24, 67),
(213, 31, 67),
(214, 17, 62),
(215, 24, 62),
(216, 31, 62),
(217, 3, 88),
(218, 10, 88),
(219, 17, 88),
(220, 3, 83),
(221, 10, 83),
(222, 17, 83),
(223, 3, 78),
(224, 10, 78),
(225, 17, 78),
(226, 17, 73),
(227, 24, 73),
(228, 31, 73),
(229, 17, 68),
(230, 24, 68),
(231, 31, 68),
(232, 17, 63),
(233, 24, 63),
(234, 31, 63),
(235, 3, 89),
(236, 10, 89),
(237, 17, 89),
(238, 3, 84),
(239, 10, 84),
(240, 17, 84),
(241, 3, 79),
(242, 10, 79),
(243, 17, 79),
(244, 17, 74),
(245, 24, 74),
(246, 31, 74),
(247, 17, 69),
(248, 24, 69),
(249, 31, 69),
(250, 17, 64),
(251, 24, 64),
(252, 31, 64),
(253, 3, 90),
(254, 10, 90),
(255, 17, 90),
(256, 3, 85),
(257, 10, 85),
(258, 17, 85),
(259, 3, 80),
(260, 10, 80),
(261, 17, 80),
(262, 17, 75),
(263, 24, 75),
(264, 31, 75),
(265, 17, 70),
(266, 24, 70),
(267, 31, 70),
(268, 17, 65),
(269, 24, 65),
(270, 31, 65),
(271, 4, 116),
(272, 11, 116),
(273, 18, 116),
(274, 4, 111),
(275, 11, 111),
(276, 18, 111),
(277, 4, 106),
(278, 11, 106),
(279, 18, 106),
(280, 18, 101),
(281, 25, 101),
(282, 32, 101),
(283, 18, 96),
(284, 25, 96),
(285, 32, 96),
(286, 18, 91),
(287, 25, 91),
(288, 32, 91),
(289, 4, 117),
(290, 11, 117),
(291, 18, 117),
(292, 4, 112),
(293, 11, 112),
(294, 18, 112),
(295, 4, 107),
(296, 11, 107),
(297, 18, 107),
(298, 18, 102),
(299, 25, 102),
(300, 32, 102),
(301, 18, 97),
(302, 25, 97),
(303, 32, 97),
(304, 18, 92),
(305, 25, 92),
(306, 32, 92),
(307, 4, 118),
(308, 11, 118),
(309, 18, 118),
(310, 4, 113),
(311, 11, 113),
(312, 18, 113),
(313, 4, 108),
(314, 11, 108),
(315, 18, 108),
(316, 18, 103),
(317, 25, 103),
(318, 32, 103),
(319, 18, 98),
(320, 25, 98),
(321, 32, 98),
(322, 18, 93),
(323, 25, 93),
(324, 32, 93),
(325, 4, 119),
(326, 11, 119),
(327, 18, 119),
(328, 4, 114),
(329, 11, 114),
(330, 18, 114),
(331, 4, 109),
(332, 11, 109),
(333, 18, 109),
(334, 18, 104),
(335, 25, 104),
(336, 32, 104),
(337, 18, 99),
(338, 25, 99),
(339, 32, 99),
(340, 18, 94),
(341, 25, 94),
(342, 32, 94),
(343, 4, 120),
(344, 11, 120),
(345, 18, 120),
(346, 4, 115),
(347, 11, 115),
(348, 18, 115),
(349, 4, 110),
(350, 11, 110),
(351, 18, 110),
(352, 18, 105),
(353, 25, 105),
(354, 32, 105),
(355, 18, 100),
(356, 25, 100),
(357, 32, 100),
(358, 18, 95),
(359, 25, 95),
(360, 32, 95),
(361, 5, 146),
(362, 12, 146),
(363, 19, 146),
(364, 5, 141),
(365, 12, 141),
(366, 19, 141),
(367, 5, 136),
(368, 12, 136),
(369, 19, 136),
(370, 19, 131),
(371, 26, 131),
(372, 33, 131),
(373, 19, 126),
(374, 26, 126),
(375, 33, 126),
(376, 19, 121),
(377, 26, 121),
(378, 33, 121),
(379, 5, 147),
(380, 12, 147),
(381, 19, 147),
(382, 5, 142),
(383, 12, 142),
(384, 19, 142),
(385, 5, 137),
(386, 12, 137),
(387, 19, 137),
(388, 19, 132),
(389, 26, 132),
(390, 33, 132),
(391, 19, 127),
(392, 26, 127),
(393, 33, 127),
(394, 19, 122),
(395, 26, 122),
(396, 33, 122),
(397, 5, 148),
(398, 12, 148),
(399, 19, 148),
(400, 5, 143),
(401, 12, 143),
(402, 19, 143),
(403, 5, 138),
(404, 12, 138),
(405, 19, 138),
(406, 19, 133),
(407, 26, 133),
(408, 33, 133),
(409, 19, 128),
(410, 26, 128),
(411, 33, 128),
(412, 19, 123),
(413, 26, 123),
(414, 33, 123),
(415, 5, 149),
(416, 12, 149),
(417, 19, 149),
(418, 5, 144),
(419, 12, 144),
(420, 19, 144),
(421, 5, 139),
(422, 12, 139),
(423, 19, 139),
(424, 19, 134),
(425, 26, 134),
(426, 33, 134),
(427, 19, 129),
(428, 26, 129),
(429, 33, 129),
(430, 19, 124),
(431, 26, 124),
(432, 33, 124),
(433, 5, 150),
(434, 12, 150),
(435, 19, 150),
(436, 5, 145),
(437, 12, 145),
(438, 19, 145),
(439, 5, 140),
(440, 12, 140),
(441, 19, 140),
(442, 19, 135),
(443, 26, 135),
(444, 33, 135),
(445, 19, 130),
(446, 26, 130),
(447, 33, 130),
(448, 19, 125),
(449, 26, 125),
(450, 33, 125),
(451, 6, 176),
(452, 13, 176),
(453, 20, 176),
(454, 6, 171),
(455, 13, 171),
(456, 20, 171),
(457, 6, 166),
(458, 13, 166),
(459, 20, 166),
(460, 20, 161),
(461, 27, 161),
(462, 34, 161),
(463, 20, 156),
(464, 27, 156),
(465, 34, 156),
(466, 20, 151),
(467, 27, 151),
(468, 34, 151),
(469, 6, 177),
(470, 13, 177),
(471, 20, 177),
(472, 6, 172),
(473, 13, 172),
(474, 20, 172),
(475, 6, 167),
(476, 13, 167),
(477, 20, 167),
(478, 20, 162),
(479, 27, 162),
(480, 34, 162),
(481, 20, 157),
(482, 27, 157),
(483, 34, 157),
(484, 20, 152),
(485, 27, 152),
(486, 34, 152),
(487, 6, 178),
(488, 13, 178),
(489, 20, 178),
(490, 6, 173),
(491, 13, 173),
(492, 20, 173),
(493, 6, 168),
(494, 13, 168),
(495, 20, 168),
(496, 20, 163),
(497, 27, 163),
(498, 34, 163),
(499, 20, 158),
(500, 27, 158),
(501, 34, 158),
(502, 20, 153),
(503, 27, 153),
(504, 34, 153),
(505, 6, 179),
(506, 13, 179),
(507, 20, 179),
(508, 6, 174),
(509, 13, 174),
(510, 20, 174),
(511, 6, 169),
(512, 13, 169),
(513, 20, 169),
(514, 20, 164),
(515, 27, 164),
(516, 34, 164),
(517, 20, 159),
(518, 27, 159),
(519, 34, 159),
(520, 20, 154),
(521, 27, 154),
(522, 34, 154),
(523, 6, 180),
(524, 13, 180),
(525, 20, 180),
(526, 6, 175),
(527, 13, 175),
(528, 20, 175),
(529, 6, 170),
(530, 13, 170),
(531, 20, 170),
(532, 20, 165),
(533, 27, 165),
(534, 34, 165),
(535, 20, 160),
(536, 27, 160),
(537, 34, 160),
(538, 20, 155),
(539, 27, 155),
(540, 34, 155),
(541, 7, 206),
(542, 14, 206),
(543, 21, 206),
(544, 7, 201),
(545, 14, 201),
(546, 21, 201),
(547, 7, 196),
(548, 14, 196),
(549, 21, 196),
(550, 21, 191),
(551, 28, 191),
(552, 35, 191),
(553, 21, 186),
(554, 28, 186),
(555, 35, 186),
(556, 21, 181),
(557, 28, 181),
(558, 35, 181),
(559, 7, 207),
(560, 14, 207),
(561, 21, 207),
(562, 7, 202),
(563, 14, 202),
(564, 21, 202),
(565, 7, 197),
(566, 14, 197),
(567, 21, 197),
(568, 21, 192),
(569, 28, 192),
(570, 35, 192),
(571, 21, 187),
(572, 28, 187),
(573, 35, 187),
(574, 21, 182),
(575, 28, 182),
(576, 35, 182),
(577, 7, 208),
(578, 14, 208),
(579, 21, 208),
(580, 7, 203),
(581, 14, 203),
(582, 21, 203),
(583, 7, 198),
(584, 14, 198),
(585, 21, 198),
(586, 21, 193),
(587, 28, 193),
(588, 35, 193),
(589, 21, 188),
(590, 28, 188),
(591, 35, 188),
(592, 21, 183),
(593, 28, 183),
(594, 35, 183),
(595, 7, 209),
(596, 14, 209),
(597, 21, 209),
(598, 7, 204),
(599, 14, 204),
(600, 21, 204),
(601, 7, 199),
(602, 14, 199),
(603, 21, 199),
(604, 21, 194),
(605, 28, 194),
(606, 35, 194),
(607, 21, 189),
(608, 28, 189),
(609, 35, 189),
(610, 21, 184),
(611, 28, 184),
(612, 35, 184),
(613, 7, 210),
(614, 14, 210),
(615, 21, 210),
(616, 7, 205),
(617, 14, 205),
(618, 21, 205),
(619, 7, 200),
(620, 14, 200),
(621, 21, 200),
(622, 21, 195),
(623, 28, 195),
(624, 35, 195),
(625, 21, 190),
(626, 28, 190),
(627, 35, 190),
(628, 21, 185),
(629, 28, 185),
(630, 35, 185),
(631, 1, 511),
(633, 1, 512),
(634, 1, 513),
(636, 8, 511),
(637, 15, 511),
(638, 8, 512),
(639, 15, 512),
(640, 8, 513),
(641, 15, 513),
(642, 8, 514),
(643, 15, 514),
(644, 1, 514),
(645, 22, 513),
(646, 29, 513),
(647, 22, 514),
(648, 29, 514),
(649, 22, 515),
(650, 29, 515),
(651, 22, 516),
(652, 29, 516),
(653, 2, 554),
(654, 9, 554),
(655, 2, 555),
(656, 9, 555),
(657, 2, 556),
(658, 9, 556),
(659, 2, 557),
(660, 9, 557),
(661, 16, 556),
(662, 23, 556),
(663, 30, 556),
(664, 16, 557),
(665, 23, 557),
(666, 30, 557),
(667, 16, 558),
(668, 23, 558),
(669, 30, 558),
(670, 16, 559),
(671, 23, 559),
(672, 30, 559),
(673, 2, 560),
(674, 9, 560),
(675, 16, 560),
(676, 23, 560),
(677, 30, 560),
(678, 2, 561),
(679, 9, 561),
(680, 16, 561),
(681, 23, 561),
(682, 30, 561),
(683, 2, 562),
(684, 9, 562),
(685, 16, 562),
(686, 23, 562),
(687, 30, 562),
(688, 2, 563),
(689, 9, 563),
(690, 16, 563);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `slots`
--

CREATE TABLE `slots` (
  `id` int(11) NOT NULL,
  `end_time` time(6) DEFAULT NULL,
  `start_time` time(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `slots`
--

INSERT INTO `slots` (`id`, `end_time`, `start_time`) VALUES
(1, '10:00:00.000000', '08:00:00.000000'),
(2, '12:00:00.000000', '10:00:00.000000'),
(3, '15:00:00.000000', '13:00:00.000000'),
(4, '17:00:00.000000', '15:00:00.000000'),
(5, '20:00:00.000000', '18:00:00.000000'),
(6, '22:00:00.000000', '20:00:00.000000');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `keycode` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `status` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `created_at`, `updated_at`, `email`, `fullname`, `keycode`, `phone`, `provider`, `status`) VALUES
(1, '2024-06-22 15:21:45.000000', NULL, 'doctorlinktest12345@gmail.com', 'John Smith', NULL, '0908222222', 'phone', b'1'),
(2, '2024-06-22 15:21:45.000000', NULL, 'doctormaitest12345@gmail.com', 'Michael Johnson', NULL, '0908222223', 'phone', b'1'),
(3, '2024-06-22 15:21:45.000000', NULL, 'doctorlantest12345@gmail.com', 'Robert Brown', NULL, '0908222224', 'phone', b'1'),
(4, '2024-06-22 15:21:45.000000', NULL, 'doctortuyettest12345@gmail.com', 'James Davis', NULL, '0908222225', 'phone', b'1'),
(5, '2024-06-22 15:21:45.000000', NULL, 'doctoryentest12345@gmail.com', 'William Martinez', NULL, '0908222226', 'phone', b'1'),
(6, '2024-06-22 15:21:45.000000', NULL, 'doctorkhoatest12345@gmail.com', 'David Garcia', NULL, '0908222227', 'phone', b'1'),
(7, '2024-06-22 15:21:45.000000', NULL, 'doctordaotest12345@gmail.com', 'Richard Miller', NULL, '0908222228', 'phone', b'1'),
(8, '2024-06-22 15:21:45.000000', NULL, 'doctorsentest12345@gmail.com', 'Charles Wilson', NULL, '0908222229', 'phone', b'1'),
(9, '2024-06-22 15:21:45.000000', NULL, 'doctorthaotest12345@gmail.com', 'Thomas Moore', NULL, '0908222230', 'phone', b'1'),
(10, '2024-06-22 15:21:45.000000', NULL, 'doctorminhtest12345@gmail.com', 'Christopher Taylor', NULL, '0908222231', 'phone', b'1'),
(11, '2024-06-22 15:21:45.000000', NULL, 'doctorantest12345@gmail.com', 'Daniel Anderson', NULL, '0908222232', 'phone', b'1'),
(12, '2024-06-22 15:21:45.000000', NULL, 'doctorbaotest12345@gmail.com', 'Matthew Thomas', NULL, '0908222233', 'phone', b'1'),
(13, '2024-06-22 15:21:45.000000', NULL, 'doctorcuongtest12345@gmail.com', 'Anthony Jackson', NULL, '0908222234', 'phone', b'1'),
(14, '2024-06-22 15:21:45.000000', NULL, 'doctordongtest12345@gmail.com', 'Mark White', NULL, '0908222235', 'phone', b'1'),
(15, '2024-06-22 15:21:45.000000', NULL, 'doctorhungtest12345@gmail.com', 'Donald Harris', NULL, '0908222236', 'phone', b'1'),
(16, '2024-06-22 15:21:45.000000', NULL, 'doctorkhaitest12345@gmail.com', 'Paul Martin', NULL, '0908222237', 'phone', b'1'),
(17, '2024-06-22 15:21:45.000000', NULL, 'doctorloitest12345@gmail.com', 'Steven Thompson', NULL, '0908222238', 'phone', b'1'),
(18, '2024-06-22 15:21:45.000000', NULL, 'doctornamtest12345@gmail.com', 'Jane Doe', NULL, '0908222239', 'phone', b'1'),
(19, '2024-06-22 15:21:45.000000', NULL, 'doctorquangtest12345@gmail.com', 'Mary Smith', NULL, '0908222240', 'phone', b'1'),
(20, '2024-06-22 15:21:45.000000', NULL, 'doctorthanhtest12345@gmail.com', 'Patricia Johnson', NULL, '0908222241', 'phone', b'1'),
(21, '2024-06-22 15:21:45.000000', NULL, 'doctornhitest12345@gmail.com', 'Linda Williams', NULL, '0908222242', 'phone', b'1'),
(22, '2024-06-22 15:21:45.000000', NULL, 'doctorbachtest12345@gmail.com', 'Barbara Brown', NULL, '0908222243', 'phone', b'1'),
(23, '2024-06-22 15:21:45.000000', NULL, 'doctoranhtest12345@gmail.com', 'Elizabeth Jones', NULL, '0908222244', 'phone', b'1'),
(24, '2024-06-22 15:21:45.000000', NULL, 'doctortamtest12345@gmail.com', 'Jennifer Garcia', NULL, '0908222245', 'phone', b'1'),
(25, '2024-06-22 15:21:45.000000', NULL, 'doctortuantest12345@gmail.com', 'Maria Martinez', NULL, '0908222246', 'phone', b'1'),
(26, '2024-06-22 15:21:45.000000', NULL, 'doctorhatest12345@gmail.com', 'Susan Davis', NULL, '0908222247', 'phone', b'1'),
(27, '2024-06-22 15:21:45.000000', NULL, 'doctorphattest12345@gmail.com', 'Margaret Wilson', NULL, '0908222248', 'phone', b'1'),
(28, '2024-06-22 15:21:45.000000', NULL, 'doctorphuctest12345@gmail.com', 'Dorothy Anderson', NULL, '0908222249', 'phone', b'1'),
(29, '2024-06-22 15:21:45.000000', NULL, 'doctorlientest12345@gmail.com', 'Lisa Thomas', NULL, '0908222250', 'phone', b'1'),
(30, '2024-06-22 15:21:45.000000', NULL, 'doctorkhanhtest12345@gmail.com', 'Nancy Jackson', NULL, '0908222251', 'phone', b'1'),
(31, '2024-06-22 15:21:45.000000', NULL, 'doctordientest12345@gmail.com', 'Karen White', NULL, '0908222252', 'phone', b'1'),
(32, '2024-06-22 15:21:45.000000', NULL, 'doctorviettest12345@gmail.com', 'Betty Harris', NULL, '0908222253', 'phone', b'1'),
(33, '2024-06-22 15:21:45.000000', NULL, 'doctorthutest12345@gmail.com', 'Helen Martin', NULL, '0908222254', 'phone', b'1'),
(34, '2024-06-22 15:21:45.000000', NULL, 'doctorsontest12345@gmail.com', 'Sandra Thompson', NULL, '0908222255', 'phone', b'1'),
(35, '2024-06-22 15:21:45.000000', NULL, 'doctorngoctest12345@gmail.com', 'Donna Moore', NULL, '0908222256', 'phone', b'1'),

(36, '2024-06-22 15:21:45.000000', NULL, 'duongtuanganh@gmail.com', 'John Doe', NULL, '0908333333', 'phone', b'1'),
(37, '2024-06-22 15:21:45.000000', NULL, 'levanduy@gmail.com', 'Michael Smith', NULL, '0908333334', 'phone', b'1'),
(38, '2024-06-22 15:21:45.000000', NULL, 'tranvanthanh@gmail.com', 'James Johnson', NULL, '0908333335', 'phone', b'1'),
(39, '2024-06-22 15:21:45.000000', NULL, 'nguyenthithanh@gmail.com', 'Emily Davis', NULL, '0908333336', 'phone', b'1'),
(40, '2024-06-22 15:21:45.000000', NULL, 'buithihuong@gmail.com', 'Sophia Brown', NULL, '0908333337', 'phone', b'1'),

(41, '2024-06-22 15:21:45.000000', NULL, 'admin01@gmail.com', 'Nguyễn Anh Khoa', NULL, '0908111111', 'phone', b'1'),
(42, '2024-06-22 15:21:45.000000', NULL, 'admin02@gmail.com', 'Vũ Duy Hiển', NULL, '0908111112', 'phone', b'1'),
(43, '2024-06-22 15:21:45.000000', NULL, 'admin03@gmail.com', 'Phùng Văn An', NULL, '0908111113', 'phone', b'1'),
(44, '2024-06-22 15:21:45.000000', NULL, 'admin04@gmail.com', 'Đỗ Nguyên Chương', NULL, '0908111114', 'phone', b'1');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `user_roles`
--

INSERT INTO `user_roles` (`user_id`, `role_id`) VALUES
(1, 2),
(2, 2),
(3, 2),
(4, 2),
(5, 2),
(6, 2),
(7, 2),
(8, 2),
(9, 2),
(10, 2),
(11, 2),
(12, 2),
(13, 2),
(14, 2),
(15, 2),
(16, 2),
(17, 2),
(18, 2),
(19, 2),
(20, 2),
(21, 2),
(22, 2),
(23, 2),
(24, 2),
(25, 2),
(26, 2),
(27, 2),
(28, 2),
(29, 2),
(30, 2),
(31, 2),
(32, 2),
(33, 2),
(34, 2),
(35, 2),

(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),

(41, 3),
(42, 3),
(43, 3),
(44, 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `workings`
--

CREATE TABLE `workings` (
  `id` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `end_work` date DEFAULT NULL,
  `start_work` date DEFAULT NULL,
  `status` bit(1) NOT NULL,
  `doctor_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `workings`
--

INSERT INTO `workings` (`id`, `created_at`, `updated_at`, `address`, `company`, `end_work`, `start_work`, `status`, `doctor_id`) VALUES
(1, '2024-06-22 15:28:15.000000', NULL, '123 Main St, Anytown, CA 12345', 'Central Traditional Medicine Hospital', '2010-12-31', '2005-01-01', b'1', 1),
(2, '2024-06-22 15:28:15.000000', NULL, '456 Oak St, Othertown, NY 54321', 'Vinmec International General Hospital', '2015-12-31', '2011-01-01', b'1', 1),
(3, '2024-06-22 15:28:15.000000', NULL, '789 Elm St, Somewhere, TX 67890', 'National Heart Institute', '2020-12-31', '2016-01-01', b'1', 1),
(4, '2024-06-22 15:28:15.000000', NULL, '321 Pine St, Anytown, CA 12345', 'Binh Minh Healthcare Company', '2013-12-31', '2010-01-01', b'1', 2),
(5, '2024-06-22 15:28:15.000000', NULL, '654 Maple Ave, Othertown, NY 54321', 'Phuc Loi Medical Center', '2017-12-31', '2014-01-01', b'1', 2),
(6, '2024-06-22 15:28:15.000000', NULL, '987 Walnut St, Somewhere, TX 67890', 'Dong Y Health Institute', '2023-12-31', '2018-01-01', b'1', 2),
(7, '2024-06-22 15:28:15.000000', NULL, '234 Oak St, Anytown, CA 12345', 'Hanoi Urban Health Center', '2006-12-31', '2002-01-01', b'1', 3),
(8, '2024-06-22 15:28:15.000000', NULL, '543 Maple Ave, Othertown, NY 54321', 'Ho Chi Minh City International General Hospital', '2013-12-31', '2007-01-01', b'1', 3),
(9, '2024-06-22 15:28:15.000000', NULL, '876 Elm St, Somewhere, TX 67890', 'Da Nang Preventive Health Center', '2020-12-31', '2014-01-01', b'1', 3),
(10, '2024-06-22 15:28:15.000000', NULL, '111 Main St, Anytown, CA 12345', 'Children Hospital 1', '2010-12-31', '2007-01-01', b'1', 4),
(11, '2024-06-22 15:28:15.000000', NULL, '222 Pine St, Othertown, NY 54321', 'Children Hospital 2', '2014-12-31', '2011-01-01', b'1', 4),
(12, '2024-06-22 15:28:15.000000', NULL, '333 Elm St, Somewhere, TX 67890', 'Children Hospital 3', '2020-12-31', '2015-01-01', b'1', 4),
(13, '2024-06-22 15:28:15.000000', NULL, '444 Maple Ave, Anytown, CA 12345', 'Hanoi Heart Hospital', '2014-12-31', '2011-01-01', b'1', 5),
(14, '2024-06-22 15:28:15.000000', NULL, '555 Pine St, Othertown, NY 54321', 'Ho Chi Minh City Heart Hospital', '2018-12-31', '2015-01-01', b'1', 5),
(15, '2024-06-22 15:28:15.000000', NULL, '666 Elm St, Somewhere, TX 67890', 'Da Nang Heart Hospital', '2023-12-31', '2019-01-01', b'1', 5),
(16, '2024-06-22 15:28:15.000000', NULL, '777 Oak St, Anytown, CA 12345', 'Hanoi Disease Control Center', '2007-12-31', '2003-01-01', b'1', 6),
(17, '2024-06-22 15:28:15.000000', NULL, '888 Pine St, Othertown, NY 54321', 'Ho Chi Minh City Disease Control Center', '2013-12-31', '2008-01-01', b'1', 6),
(18, '2024-06-22 15:28:15.000000', NULL, '999 Elm St, Somewhere, TX 67890', 'Da Nang Disease Control Center', '2020-12-31', '2014-01-01', b'1', 6),
(19, '2024-06-22 15:28:15.000000', NULL, '111 Pine St, Anytown, CA 12345', 'Community Health Institute', '2013-12-31', '2009-01-01', b'1', 7),
(20, '2024-06-22 15:28:15.000000', NULL, '222 Elm St, Othertown, NY 54321', 'Disease Prevention Health Center', '2017-12-31', '2014-01-01', b'1', 7),
(21, '2024-06-22 15:28:15.000000', NULL, '333 Maple Ave, Somewhere, TX 67890', 'Mental Health Institute', '2020-12-31', '2018-01-01', b'1', 7),
(22, '2024-06-22 15:28:15.000000', NULL, '444 Oak St, Anytown, CA 12345', 'Endocrinology Hospital', '2017-12-31', '2014-01-01', b'1', 8),
(23, '2024-06-22 15:28:15.000000', NULL, '555 Pine St, Othertown, NY 54321', 'Nutrition Institute', '2020-12-31', '2018-01-01', b'1', 8),
(24, '2024-06-22 15:28:15.000000', NULL, '666 Elm St, Somewhere, TX 67890', 'Disease Control Center', '2023-12-31', '2021-01-01', b'1', 8),
(25, '2024-06-22 15:28:15.000000', NULL, '777 Oak St, Anytown, CA 12345', 'Obstetrics Institute', '2010-12-31', '2006-01-01', b'1', 9),
(26, '2024-06-22 15:28:15.000000', NULL, '888 Pine St, Othertown, NY 54321', 'ENT Hospital', '2016-12-31', '2011-01-01', b'1', 9),
(27, '2024-06-22 15:28:15.000000', NULL, '999 Elm St, Somewhere, TX 67890', 'Eye Hospital', '2023-12-31', '2017-01-01', b'1', 9),
(28, '2024-06-22 15:28:15.000000', NULL, '111 Oak St, Anytown, CA 12345', 'Lung and Pulmonary Health Center', '2015-12-31', '2012-01-01', b'1', 10),
(29, '2024-06-22 15:28:15.000000', NULL, '222 Pine St, Othertown, NY 54321', 'Cancer Hospital', '2018-12-31', '2016-01-01', b'1', 10),
(30, '2024-06-22 15:28:15.000000', NULL, '333 Elm St, Somewhere, TX 67890', 'Elderly Health Care Institute', '2020-12-31', '2019-01-01', b'1', 10),
(31, '2024-06-22 15:28:15.000000', NULL, '444 Oak St, Anytown, CA 12345', 'Nursing Institute', '2009-12-31', '2005-01-01', b'1', 11),
(32, '2024-06-22 15:28:15.000000', NULL, '555 Pine St, Othertown, NY 54321', 'Functional Rehabilitation Center', '2014-12-31', '2010-01-01', b'1', 11),
(33, '2024-06-22 15:28:15.000000', NULL, '666 Elm St, Somewhere, TX 67890', 'Children Health Protection Institute', '2020-12-31', '2015-01-01', b'1', 11),
(34, '2024-06-22 15:28:15.000000', NULL, '777 Oak St, Anytown, CA 12345', 'Dermatology Institute', '2014-12-31', '2010-01-01', b'1', 12),
(35, '2024-06-22 15:28:15.000000', NULL, '888 Pine St, Othertown, NY 54321', 'Bone and Joint Health Center', '2018-12-31', '2015-01-01', b'1', 12),
(36, '2024-06-22 15:28:15.000000', NULL, '224 Oak St, Anytown, CA 12345', 'Neurology Hospital', '2023-12-31', '2019-01-01', b'1', 12),
(37, '2024-06-22 15:28:15.000000', NULL, '92 Maple St, Othertown, NY 54321', 'Endocrinology Health Center', '2008-12-31', '2002-01-01', b'1', 13),
(38, '2024-06-22 15:28:15.000000', NULL, '125 Elm St, Anytown, CA 12345', 'Dental Hospital', '2014-12-31', '2009-01-01', b'1', 13),
(39, '2024-06-22 15:28:15.000000', NULL, '43 Oak St, Anytown, CA 12345', 'Public Health Institute', '2020-12-31', '2015-01-01', b'1', 13),
(40, '2024-06-22 15:28:15.000000', NULL, '76 Pine St, Othertown, NY 54321', 'Psychiatric Hospital', '2010-12-31', '2007-01-01', b'1', 14),
(41, '2024-06-22 15:28:15.000000', NULL, '26 Elm St, Anytown, CA 12345', 'Disease Control Center', '2014-12-31', '2011-01-01', b'1', 14),
(42, '2024-06-22 15:28:15.000000', NULL, '98 Maple St, Othertown, NY 54321', 'International Obstetrics Hospital', '2020-12-31', '2015-01-01', b'1', 14),
(43, '2024-06-22 15:28:15.000000', NULL, '22 Oak St, Anytown, CA 12345', 'Elderly Care Institute', '2015-12-31', '2011-01-01', b'1', 15),
(44, '2024-06-22 15:28:15.000000', NULL, '202 Pine St, Othertown, NY 54321', 'Medical Research Center', '2018-12-31', '2016-01-01', b'1', 15),
(45, '2024-06-22 15:28:15.000000', NULL, '32 Elm St, Anytown, CA 12345', 'Infectious Disease Prevention Institute', '2023-12-31', '2019-01-01', b'1', 15),
(46, '2024-06-22 15:28:15.000000', NULL, '63 Maple St, Othertown, NY 54321', 'Traditional Medicine Institute', '2008-12-31', '2003-01-01', b'1', 16),
(47, '2024-06-22 15:28:15.000000', NULL, '26 Oak St, Anytown, CA 12345', 'Psychiatric Hospital', '2015-12-31', '2009-01-01', b'1', 16),
(48, '2024-06-22 15:28:15.000000', NULL, '73 Elm St, Anytown, CA 12345', 'Allergy and Immunology Institute', '2021-12-31', '2016-01-01', b'1', 16),
(49, '2024-06-22 15:28:15.000000', NULL, '19 Pine St, Othertown, NY 54321', 'Preventive Health Center', '2014-12-31', '2009-01-01', b'1', 17),
(50, '2024-06-22 15:28:15.000000', NULL, '220 Elm St, Anytown, CA 12345', 'Orthopedic Trauma Hospital', '2018-12-31', '2015-01-01', b'1', 17),
(51, '2024-06-22 15:28:15.000000', NULL, '30 Oak St, Anytown, CA 12345', 'Dermatology Institute', '2022-12-31', '2019-01-01', b'1', 17),
(52, '2024-06-22 15:28:15.000000', NULL, '52 Elm St, Anytown, CA 12345', 'National Pediatric Hospital', '2008-12-31', '2004-01-01', b'1', 18),
(53, '2024-06-22 15:28:15.000000', NULL, '205 Maple St, Othertown, NY 54321', 'Hanoi Obstetrics Hospital', '2013-12-31', '2009-01-01', b'1', 18),
(54, '2024-06-22 15:28:15.000000', NULL, '89 Elm St, Anytown, CA 12345', 'Mental Health Institute', '2019-12-31', '2014-01-01', b'1', 18),
(55, '2024-06-22 15:28:15.000000', NULL, '12 Oak St, Anytown, CA 12345', 'International General Hospital', '2010-12-31', '2006-01-01', b'1', 19),
(56, '2024-06-22 15:28:15.000000', NULL, '98 Maple St, Othertown, NY 54321', 'Disease Control Center', '2016-12-31', '2011-01-01', b'1', 19),
(57, '2024-06-22 15:28:15.000000', NULL, '84 Pine St, Othertown, NY 54321', 'Endocrinology Hospital', '2022-12-31', '2017-01-01', b'1', 19),
(58, '2024-06-22 15:28:15.000000', NULL, '72 Oak St, Anytown, CA 12345', 'National Heart Institute', '2014-12-31', '2012-01-01', b'1', 20),
(59, '2024-06-22 15:28:15.000000', NULL, '12 Elm St, Anytown, CA 12345', 'Oncology Hospital', '2016-12-31', '2015-01-01', b'1', 20),
(60, '2024-06-22 15:28:15.000000', NULL, '98 Pine St, Othertown, NY 54321', 'Nutrition Institute', '2018-12-31', '2017-01-01', b'1', 20),
(61, '2024-06-22 15:28:15.000000', NULL, '54 Maple St, Othertown, NY 54321', 'Dermatology Hospital', '2006-12-31', '2000-01-01', b'1', 21),
(62, '2024-06-22 15:28:15.000000', NULL, '299 Elm St, Anytown, CA 12345', 'Heart Institute', '2013-12-31', '2007-01-01', b'1', 21),
(63, '2024-06-22 15:28:15.000000', NULL, '82 Oak St, Anytown, CA 12345', 'Preventive Health Center', '2020-12-31', '2014-01-01', b'1', 21),
(64, '2024-06-22 15:28:15.000000', NULL, '61 Elm St, Anytown, CA 12345', 'Orthopedic Trauma Hospital', '2003-12-31', '1995-01-01', b'1', 22),
(65, '2024-06-22 15:28:15.000000', NULL, '54 Maple St, Anytown, CA 12345', 'Nutrition Institute', '2012-12-31', '2004-01-01', b'1', 22),
(66, '2024-06-22 15:28:15.000000', NULL, '92 Oak St, Citytown, CA 12345', 'Disease Control Center', '2021-12-31', '2013-01-01', b'1', 22),
(67, '2024-06-22 15:28:15.000000', NULL, '47 Maple St, Smallville, TX 67890', 'Mental Health Hospital', '2009-12-31', '2004-01-01', b'1', 23),
(68, '2024-06-22 15:28:15.000000', NULL, '98 Elm St, Smalltown, TX 67890', 'Obstetrics Institute', '2015-12-31', '2010-01-01', b'1', 23),
(69, '2024-06-22 15:28:15.000000', NULL, '12 Willow St, Smalltown, TX 67890', 'Endocrinology Hospital', '2021-12-31', '2016-01-01', b'1', 23),
(70, '2024-06-22 15:28:15.000000', NULL, '29 Pine St, Townsville, NY 54321', 'Respiratory Health Center', '2013-12-31', '2010-01-01', b'1', 24),
(71, '2024-06-22 15:28:15.000000', NULL, '56 Maple St, Townsville, NY 54321', 'Elderly Health Care Institute', '2016-12-31', '2014-01-01', b'1', 24),
(72, '2024-06-22 15:28:15.000000', NULL, '29 Willow St, Townsville, NY 54321', 'Oncology Hospital', '2019-12-31', '2017-01-01', b'1', 24),
(73, '2024-06-22 15:28:15.000000', NULL, '92 Oak St, Suburbia, CA 12345', 'Eye Hospital', '2009-12-31', '2006-01-01', b'1', 25),
(74, '2024-06-22 15:28:15.000000', NULL, '67 Maple St, Suburbia, CA 12345', 'Nutrition Institute', '2013-12-31', '2010-01-01', b'1', 25),
(75, '2024-06-22 15:28:15.000000', NULL, '62 Elm St, Suburbia, CA 12345', 'ENT Hospital', '2018-12-31', '2014-01-01', b'1', 25),
(76, '2024-06-22 15:28:15.000000', NULL, '256 Oak St, Capital City, NY 54321', 'Orthopedic Trauma Hospital', '2005-12-31', '1999-01-01', b'1', 26),
(77, '2024-06-22 15:28:15.000000', NULL, '378 Maple St, Metroville, NY 54321', 'Medical Research Institute', '2011-12-31', '2006-01-01', b'1', 26),
(78, '2024-06-22 15:28:15.000000', NULL, '482 Willow St, Metropolis, NY 54321', 'Preventive Health Center', '2019-12-31', '2012-01-01', b'1', 26),
(79, '2024-06-22 15:28:15.000000', NULL, '139 Elm St, Cityville, CA 12345', 'Heart Institute', '2015-12-31', '2012-01-01', b'1', 27),
(80, '2024-06-22 15:28:15.000000', NULL, '293 Oak St, Metroville, CA 12345', 'Dermatology Hospital', '2019-12-31', '2016-01-01', b'1', 27),
(81, '2024-06-22 15:28:15.000000', NULL, '177 Pine St, Downtown, CA 12345', 'Welfare Health Center', '2023-12-31', '2020-01-01', b'1', 27),
(82, '2024-06-22 15:28:15.000000', NULL, '402 Elm St, Central City, NY 54321', 'Public Health Institute', '2010-12-31', '2007-01-01', b'1', 28),
(83, '2024-06-22 15:28:15.000000', NULL, '218 Maple St, Downtown, NY 54321', 'Maternity Hospital', '2014-12-31', '2011-01-01', b'1', 28),
(84, '2024-06-22 15:28:15.000000', NULL, '559 Oak St, Downtown, NY 54321', 'Nutrition Institute', '2018-12-31', '2015-01-01', b'1', 28),
(85, '2024-06-22 15:28:15.000000', NULL, '668 Pine St, Uptown, NY 54321', 'ENT Hospital', '2014-12-31', '2011-01-01', b'1', 29),
(86, '2024-06-22 15:28:15.000000', NULL, '779 Maple St, Midtown, NY 54321', 'Disease Control Center', '2017-12-31', '2015-01-01', b'1', 29),
(87, '2024-06-22 15:28:15.000000', NULL, '311 Willow St, Suburbia, CA 12345', 'Elderly Health Care Institute', '2020-12-31', '2018-01-01', b'1', 29),
(88, '2024-06-22 15:28:15.000000', NULL, '152 Pine St, Uptown, NY 54321', 'Preventive Health Center', '2015-12-31', '2013-01-01', b'1', 30),
(89, '2024-06-22 15:28:15.000000', NULL, '435 Elm St, Downtown, CA 12345', 'Obstetrics Institute', '2017-12-31', '2016-01-01', b'1', 30),
(90, '2024-06-22 15:28:15.000000', NULL, '124 Willow St, Downtown, CA 12345', 'Orthopedic Trauma Hospital', '2018-12-31', '2018-01-01', b'1', 30),
(91, '2024-06-22 15:28:15.000000', NULL, '320 Oak St, Downtown, CA 12345', 'Orthopedic Trauma Hospital', '2014-12-31', '2009-01-01', b'1', 31),
(92, '2024-06-22 15:28:15.000000', NULL, '165 Pine St, Uptown, CA 12345', 'Preventive Health Center', '2018-12-31', '2015-01-01', b'1', 31),
(93, '2024-06-22 15:28:15.000000', NULL, '78 Maple St, Downtown, CA 12345', 'Dermatology Institute', '2023-12-31', '2019-01-01', b'1', 31),
(94, '2024-06-22 15:28:15.000000', NULL, '290 Oak St, Metroville, CA 12345', 'Disease Control Center', '2006-12-31', '1998-01-01', b'1', 32),
(95, '2024-06-22 15:28:15.000000', NULL, '450 Elm St, Suburbia, CA 12345', 'General Hospital', '2013-12-31', '2007-01-01', b'1', 32),
(96, '2024-06-22 15:28:15.000000', NULL, '380 Willow St, Suburbia, CA 12345', 'Children Hospital', '2019-12-31', '2014-01-01', b'1', 32),
(97, '2024-06-22 15:28:15.000000', NULL, '225 Oak St, Downtown, CA 12345', 'Heart Institute', '2018-12-31', '2015-01-01', b'1', 33),
(98, '2024-06-22 15:28:15.000000', NULL, '520 Pine St, Downtown, CA 12345', 'Allergy and Immunology Institute', '2021-12-31', '2019-01-01', b'1', 33),
(99, '2024-06-22 15:28:15.000000', NULL, '188 Willow St, Downtown, CA 12345', 'Oncology Center', '2024-12-31', '2022-01-01', b'1', 33),
(100, '2024-06-22 15:28:15.000000', NULL, '155 Elm St, Suburbia, CA 12345', 'Reproductive Health Care Center', '2015-12-31', '2013-01-01', b'1', 34),
(101, '2024-06-22 15:28:15.000000', NULL, '410 Oak St, Downtown, CA 12345', 'Lung Hospital', '2018-12-31', '2016-01-01', b'1', 34),
(102, '2024-06-22 15:28:15.000000', NULL, '575 Pine St, Downtown, CA 12345', 'Medical Diagnosis Institute', '2021-12-31', '2019-01-01', b'1', 34),
(103, '2024-06-22 15:28:15.000000', NULL, '301 Willow St, Suburbia, CA 12345', 'Rehabilitation and Functional Recovery Hospital', '1998-12-31', '1992-01-01', b'1', 35),
(104, '2024-06-22 15:28:15.000000', NULL, '512 Maple St, Cityville, CA 12345', 'Mental Health Care Center', '2007-12-31', '1999-01-01', b'1', 35),
(105, '2024-06-22 15:28:15.000000', NULL, '233 Oak St, Townsville, CA 12345', 'Public Health Institute', '2019-12-31', '2008-01-01', b'1', 35);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UKjoxilquvahs0x7lewlg9ylobv` (`scheduledoctor_id`,`clinic_hours`),
  ADD KEY `FKhb7htutf6uhe9f3lkxtbfcddj` (`partient_id`);

--
-- Chỉ mục cho bảng `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKl2mro81neln9topymd898urh1` (`department_id`),
  ADD KEY `FKe9pf5qtxxkdyrwibaevo9frtk` (`user_id`);

--
-- Chỉ mục cho bảng `feedbacks`
--
ALTER TABLE `feedbacks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK2uxpq6vjjodmoav4q5yhnr7xy` (`doctor_id`),
  ADD KEY `FKsis2cegwwrkr9y9mhcbd9n9yy` (`partient_id`);

--
-- Chỉ mục cho bảng `medicals`
--
ALTER TABLE `medicals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK23rqvhma8ra8fycobsfk7cmxu` (`partient_id`);

--
-- Chỉ mục cho bảng `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKi09n75txtudw1kawj5o7i8xag` (`user_id`);

--
-- Chỉ mục cho bảng `partients`
--
ALTER TABLE `partients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKnnoiwllbec7pqhe6gwf6d9u4s` (`user_id`);

--
-- Chỉ mục cho bảng `qualifications`
--
ALTER TABLE `qualifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKch8xweqgy0ftjebix3n24s0ab` (`doctor_id`);

--
-- Chỉ mục cho bảng `refresh_token`
--
ALTER TABLE `refresh_token`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKjtx87i0jvq2svedphegvdwcuy` (`user_id`);

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UKp13n7yf5ygeyjbdij5x08j167` (`department_id`,`slot_id`,`day_working`),
  ADD KEY `FKi5wmtra2rt1ihtxj009j1kdg6` (`slot_id`);

--
-- Chỉ mục cho bảng `schedules_doctors`
--
ALTER TABLE `schedules_doctors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKeqc1n0jh00m4xj3jjf3a7mli3` (`doctor_id`),
  ADD KEY `FKohplfu26sxfgo48dl91ms67hd` (`schedule_id`);

--
-- Chỉ mục cho bảng `slots`
--
ALTER TABLE `slots`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UKdu5v5sr43g5bfnji4vb8hg5s3` (`phone`);

--
-- Chỉ mục cho bảng `user_roles`
--
ALTER TABLE `user_roles`
  ADD KEY `FKh8ciramu9cc9q3qcqiv4ue8a6` (`role_id`),
  ADD KEY `FKhfh9dx7w3ubf1co1vdev94g3f` (`user_id`);

--
-- Chỉ mục cho bảng `workings`
--
ALTER TABLE `workings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKrjaqcs9ushlivg07m26c5u0nb` (`doctor_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT cho bảng `feedbacks`
--
ALTER TABLE `feedbacks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=176;

--
-- AUTO_INCREMENT cho bảng `medicals`
--
ALTER TABLE `medicals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `partients`
--
ALTER TABLE `partients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `qualifications`
--
ALTER TABLE `qualifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT cho bảng `refresh_token`
--
ALTER TABLE `refresh_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT cho bảng `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `schedules`
--
ALTER TABLE `schedules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=565;

--
-- AUTO_INCREMENT cho bảng `schedules_doctors`
--
ALTER TABLE `schedules_doctors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=691;

--
-- AUTO_INCREMENT cho bảng `slots`
--
ALTER TABLE `slots`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT cho bảng `workings`
--
ALTER TABLE `workings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `FK1ay6h7ea29xhf2xq7dljjiu42` FOREIGN KEY (`scheduledoctor_id`) REFERENCES `schedules_doctors` (`id`),
  ADD CONSTRAINT `FKhb7htutf6uhe9f3lkxtbfcddj` FOREIGN KEY (`partient_id`) REFERENCES `partients` (`id`);

--
-- Các ràng buộc cho bảng `doctors`
--
ALTER TABLE `doctors`
  ADD CONSTRAINT `FKe9pf5qtxxkdyrwibaevo9frtk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FKl2mro81neln9topymd898urh1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`);

--
-- Các ràng buộc cho bảng `feedbacks`
--
ALTER TABLE `feedbacks`
  ADD CONSTRAINT `FK2uxpq6vjjodmoav4q5yhnr7xy` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`),
  ADD CONSTRAINT `FKsis2cegwwrkr9y9mhcbd9n9yy` FOREIGN KEY (`partient_id`) REFERENCES `partients` (`id`);

--
-- Các ràng buộc cho bảng `medicals`
--
ALTER TABLE `medicals`
  ADD CONSTRAINT `FK23rqvhma8ra8fycobsfk7cmxu` FOREIGN KEY (`partient_id`) REFERENCES `partients` (`id`);

--
-- Các ràng buộc cho bảng `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `FKi09n75txtudw1kawj5o7i8xag` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `partients`
--
ALTER TABLE `partients`
  ADD CONSTRAINT `FKnnoiwllbec7pqhe6gwf6d9u4s` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `qualifications`
--
ALTER TABLE `qualifications`
  ADD CONSTRAINT `FKch8xweqgy0ftjebix3n24s0ab` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`);

--
-- Các ràng buộc cho bảng `refresh_token`
--
ALTER TABLE `refresh_token`
  ADD CONSTRAINT `FKjtx87i0jvq2svedphegvdwcuy` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `schedules`
--
ALTER TABLE `schedules`
  ADD CONSTRAINT `FK1qoqocbter0mwto8nvhfs38ca` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  ADD CONSTRAINT `FKi5wmtra2rt1ihtxj009j1kdg6` FOREIGN KEY (`slot_id`) REFERENCES `slots` (`id`);

--
-- Các ràng buộc cho bảng `schedules_doctors`
--
ALTER TABLE `schedules_doctors`
  ADD CONSTRAINT `FKeqc1n0jh00m4xj3jjf3a7mli3` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`),
  ADD CONSTRAINT `FKohplfu26sxfgo48dl91ms67hd` FOREIGN KEY (`schedule_id`) REFERENCES `schedules` (`id`);

--
-- Các ràng buộc cho bảng `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `FKh8ciramu9cc9q3qcqiv4ue8a6` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `FKhfh9dx7w3ubf1co1vdev94g3f` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `workings`
--
ALTER TABLE `workings`
  ADD CONSTRAINT `FKrjaqcs9ushlivg07m26c5u0nb` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
