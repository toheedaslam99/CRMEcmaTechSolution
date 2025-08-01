﻿using System;
using System.Collections.Generic;

namespace ElectriCore.Models
{
    public partial class Customer
    {
        public int Id { get; set; }
        public int LeadId { get; set; }
        public string Name { get; set; }
        public string LastName { get; set; }
        public string OtherPhone { get; set; }
        public string MobileNo { get; set; }
        public string HomePhone { get; set; }
        public string SSN { get; set; }
        public string Email { get; set; }
        public string SecondaryEmail { get; set; }
        public string CountryId { get; set; }
        public string City { get; set; }
        public string StateId { get; set; }
        public string Address { get; set; }
        public string ZipCode { get; set; }
        public string MailingCountryId { get; set; }
        public string MailingStateId { get; set; }
        public string MailingCity { get; set; }
        public string MailingAddress { get; set; }
        public string MailingZipCode { get; set; }
        public string Medicare { get; set; }
        public string DOB { get; set; }
        public int AgentId { get; set; }
        public int CloserId { get; set; }
        public string FirstCardNumber { get; set; }
        public string FirstCardHolder { get; set; }
        public string FirstCVC { get; set; }
        public string FirstExpireDate { get; set; }
        public string FirstATMPIN { get; set; }
        public string FirstCharge { get; set; }
        public string FirstAvail { get; set; }
        public string FirstDescription { get; set; }
        public string SecondCardNumber { get; set; }
        public string SecondCardHolder { get; set; }
        public string SecondCVC { get; set; }
        public string SecondExpireDate { get; set; }
        public string SecondATMPIN { get; set; }
        public string SecondDescription { get; set; }
        public string SecondCharge { get; set; }
        public string SecondAvail { get; set; }
        public string ThirdCardNumber { get; set; }
        public string ThirdCardHolder { get; set; }
        public string ThirdCVC { get; set; }
        public string ThirdExpireDate { get; set; }
        public string ThirdATMPIN { get; set; }
        public string ThirdDescription { get; set; }
        public string ThirdCharge { get; set; }
        public string ThirdAvail { get; set; }
        public string FourthCardNumber { get; set; }
        public string FourthCardHolder { get; set; }
        public string FourthCVC { get; set; }
        public string FourthExpireDate { get; set; }
        public string FourthATMPIN { get; set; }
        public string FourthDescription { get; set; }
        public string FourthCharge { get; set; }
        public string FourthAvail { get; set; }
        public string FifthCardNumber { get; set; }
        public string FifthCardHolder { get; set; }
        public string FifthCVC { get; set; }
        public string FifthExpireDate { get; set; }
        public string FifthATMPIN { get; set; }
        public string FifthDescription { get; set; }
        public string FifthCharge { get; set; }
        public string FifthAvail { get; set; }
        public string FirstAccountNumber { get; set; }
        public string FirstRoutingNumber { get; set; }
        public string FirstCheckingNumber { get; set; }
        public string FirstCheckingAvail { get; set; }
        public string FirstCheckingCharge { get; set; }
        public string FirstCheckingDescription { get; set; }
        public string SecondAccountNumber { get; set; }
        public string SecondRoutingNumber { get; set; }
        public string SecondCheckingNumber { get; set; }
        public string SecondCheckingAvail { get; set; }
        public string SecondCheckingCharge { get; set; }
        public string SecondCheckingDescription { get; set; }
        public string ThirdAccountNumber { get; set; }
        public string ThirdRoutingNumber { get; set; }
        public string ThirdCheckingNumber { get; set; }
        public string ThirdCheckingAvail { get; set; }
        public string ThirdCheckingCharge { get; set; }
        public string ThirdCheckingDescription { get; set; }
        public string FourthAccountNumber { get; set; }
        public string FourthRoutingNumber { get; set; }
        public string FourthCheckingNumber { get; set; }
        public string FourthCheckingAvail { get; set; }
        public string FourthCheckingCharge { get; set; }
        public string FourthCheckingDescription { get; set; }
        public string FifthAccountNumber { get; set; }
        public string FifthRoutingNumber { get; set; }
        public string FifthCheckingNumber { get; set; }
        public string FifthCheckingAvail { get; set; }
        public string FifthCheckingCharge { get; set; }
        public string FifthCheckingDescription { get; set; }
        public string FirstBank { get; set; }
        public string SecondBank { get; set; }
        public string ThirdBank { get; set; }
        public string FourthBank { get; set; }
        public string FifthBank { get; set; }
        public string FirstCheckingBank { get; set; }
        public string SecondCheckingBank { get; set; }
        public string ThirdCheckingBank { get; set; }
        public string FourthCheckingBank { get; set; }
        public string FifthCheckingBank { get; set; }
        public string FirstCard { get; set; }
        public string SecondCard { get; set; }
        public string ThirdCard { get; set; }
        public string FourthCard { get; set; }
        public string FifthCard { get; set; }
        public string FirstCardType { get; set; }
        public string SecondCardType { get; set; }
        public string ThirdCardType { get; set; }
        public string FourthCardType { get; set; }
        public string FifthCardType { get; set; }
        public string LeadStatus { get; set; }
        public string Description { get; set; }
        public bool IsDeleted { get; set; }
        public DateTime CreatedDateTime { get; set; }
        public DateTime? UpdatedDateTime { get; set; }
        public DateTime? DeletedDateTime { get; set; }
        public int CompanyId { get; set; }
        public int CreatedBy { get; set; }
        public int? UpdatedBy { get; set; }
        public int? DeletedBy { get; set; }

    }
}
