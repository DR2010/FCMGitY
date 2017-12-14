SET FOREIGN_KEY_CHECKS=0;




CREATE TABLE Client
(
	UID bigint NOT NULL,
	Name varchar(50) NOT NULL,
	Address varchar(50),
	Phone varchar(30),
	Fax varchar(30),
	MainContactPersonName varchar(50),
	EmailAddress varchar(50),
	CreationDateTime datetime NOT NULL,
	UpdateDateTime datetime NOT NULL,
	UserIdCreatedBy char(10) NOT NULL,
	UserIdUpdatedBy char(10) NOT NULL,
	ABN varchar(20),
	IsVoid char(1),
	FK_UserID varchar(50),
	PRIMARY KEY (UID),
	INDEX Client_idx (IsVoid ASC),
	KEY (FK_UserID)
) 
;


CREATE TABLE ClientContract
(
	FKCompanyUID bigint,
	UID bigint NOT NULL,
	ExternalID varchar(50),
	StartDate datetime,
	EndDate datetime,
	UserIdCreatedBy char(10),
	UserIdUpdatedBy char(10),
	CreationDateTime datetime,
	UpdateDateTime datetime,
	Status varchar(10),
	Type varchar(10),
	PRIMARY KEY (UID),
	KEY (FKCompanyUID)
) 
;


CREATE TABLE ClientDocument
(
	UID bigint NOT NULL,
	DocumentCUID varchar(100),
	FKClientUID bigint,
	FKClientDocumentSetUID bigint,
	FKDocumentUID bigint,
	ComboIssueNumber varchar(100),
	ClientIssueNumber int,
	SourceIssueNumber int,
	Location varchar(200),
	EndDate datetime,
	StartDate datetime,
	IsVoid char(1) NOT NULL,
	FileName varchar(100),
	SequenceNumber int,
	SourceLocation varchar(200),
	SourceFileName varchar(100),
	Generated char(1),
	ParentUID bigint,
	RecordType char(10),
	IsProjectPlan char(1),
	DocumentType varchar(10),
	Status varchar(10),
	PRIMARY KEY (UID),
	INDEX ClientDocument_idx (FKClientUID ASC, FKClientDocumentSetUID ASC),
	INDEX ClientDocument_idx2 (FKClientUID ASC, FKDocumentUID ASC, FKClientDocumentSetUID ASC, IsVoid ASC),
	KEY (FKClientUID),
	KEY (FKClientDocumentSetUID),
	KEY (FKDocumentUID)
) 
;


CREATE TABLE ClientDocumentIssue
(
	UID bigint NOT NULL,
	FKClientDocumentUID bigint NOT NULL,
	ClientIssueNumber int NOT NULL,
	Location varchar(200),
	FileName varchar(100),
	IssueNumberText varchar(4),
	SourceIssueNumber int,
	ComboIssueNumber varchar(100) NOT NULL,
	DocumentCUID varchar(20),
	FKClientUID bigint,
	PRIMARY KEY (UID),
	KEY (FKClientDocumentUID)
) 
;


CREATE TABLE ClientDocumentLink
(
	UID bigint NOT NULL,
	FKParentDocumentUID bigint NOT NULL,
	FKChildDocumentUID bigint NOT NULL,
	LinkType varchar(10) NOT NULL,
	IsVoid char(1) NOT NULL,
	FKClientDocumentSetUID bigint NOT NULL,
	FKClientUID bigint NOT NULL,
	PRIMARY KEY (UID),
	KEY (FKParentDocumentUID),
	KEY (FKChildDocumentUID)
) 
;


CREATE TABLE ClientDocumentSet
(
	UID bigint NOT NULL,
	FKClientUID bigint,
	Description varchar(50),
	Folder varchar(200),
	StartDate datetime,
	EndDate datetime,
	IsVoid char(1),
	ClientSetID bigint,
	SourceFolder varchar(200),
	Status varchar(10),
	CreationDateTime datetime,
	UpdateDateTime date,
	UserIdCreatedBy char(10),
	UserIdUpdatedBy char(10),
	PRIMARY KEY (UID),
	KEY (FKClientUID)
) 
;


CREATE TABLE CodeRelated
(
	FKCodeTypeFrom varchar(20) NOT NULL,
	FKCodeValueFrom varchar(20) NOT NULL,
	FKCodeTypeTo varchar(20) NOT NULL,
	FKCodeValueTo varchar(20) NOT NULL,
	PRIMARY KEY (FKCodeTypeFrom, FKCodeValueFrom, FKCodeTypeTo, FKCodeValueTo),
	KEY (FKCodeTypeFrom, FKCodeValueFrom),
	KEY (FKCodeTypeTo, FKCodeValueTo)
) 
;


CREATE TABLE CodeType
(
	CodeType varchar(20) NOT NULL,
	Description varchar(50),
	ShortCodeType char(3),
	PRIMARY KEY (CodeType)
) 
;


CREATE TABLE CodeValue
(
	FKCodeType varchar(20) NOT NULL,
	ID varchar(20) NOT NULL,
	Description varchar(50),
	Abbreviation varchar(10),
	ValueExtended varchar(200),
	PRIMARY KEY (FKCodeType, ID),
	KEY (FKCodeType)
) 
;


CREATE TABLE Document
(
	UID bigint NOT NULL,
	SimpleFileName varchar(100),
	CUID varchar(100) NOT NULL,
	Name varchar(100),
	SequenceNumber bigint NOT NULL,
	IssueNumber int,
	Location varchar(200),
	Comments varchar(100),
	FileName varchar(100),
	SourceCode varchar(10),
	FKClientUID bigint,
	IsVoid char(1),
	ParentUID bigint NOT NULL,
	RecordType char(10),
	FileExtension varchar(10),
	IsProjectPlan varchar(1),
	DocumentType varchar(10),
	IssueNumberText varchar(4),
	Status varchar(10),
	CreationDateTime datetime,
	UpdateDateTime datetime,
	UserIdCreatedBy varchar(50),
	UserIdUpdatedBy varchar(50),
	PRIMARY KEY (UID),
	INDEX Document_idx2 (SourceCode ASC, FKClientUID ASC),
	INDEX IX_ClientUID_UID (FKClientUID ASC, UID ASC),
	INDEX IX_SourceCode_ClientID_IsVoid (SourceCode ASC, FKClientUID ASC, IsVoid ASC),
	INDEX IX_SourceCode_IsVoid (SourceCode ASC, IsVoid ASC)
) 
;


CREATE TABLE DocumentLink
(
	UID bigint NOT NULL,
	FKParentDocumentUID bigint NOT NULL,
	FKChildDocumentUID bigint NOT NULL,
	LinkType varchar(10) NOT NULL,
	IsVoid char(1) NOT NULL,
	PRIMARY KEY (UID),
	KEY (FKParentDocumentUID),
	KEY (FKChildDocumentUID)
) 
;


CREATE TABLE DocumentSet
(
	UID bigint NOT NULL,
	TemplateType varchar(20),
	TemplateFolder varchar(50),
	IsVoid char(1),
	PRIMARY KEY (UID)
) 
;


CREATE TABLE DocumentSetDocument
(
	UID bigint NOT NULL,
	FKDocumentUID bigint,
	FKDocumentSetUID bigint,
	Location varchar(200),
	IsVoid char(1),
	StartDate datetime,
	EndDate datetime,
	FKParentDocumentUID bigint,
	SequenceNumber bigint,
	FKParentDocumentSetUID bigint,
	DocumentType varchar(100),
	PRIMARY KEY (UID),
	UNIQUE INDEX IX_DocumentSetDocument (FKDocumentSetUID ASC, FKDocumentUID ASC),
	KEY (FKDocumentUID),
	KEY (FKDocumentSetUID)
) 
;


CREATE TABLE DocumentSetDocumentLink
(
	UID bigint NOT NULL,
	FKDocumentSetUID bigint NOT NULL,
	FKParentDocumentUID bigint NOT NULL,
	FKChildDocumentUID bigint NOT NULL,
	LinkType varchar(10) NOT NULL,
	IsVoid char(1) NOT NULL,
	PRIMARY KEY (UID),
	KEY (FKParentDocumentUID),
	KEY (FKChildDocumentUID)
) 
;


CREATE TABLE DocumentSetLink
(
	UID bigint NOT NULL,
	FKDocumentUID bigint,
	FKDocumentSetUID bigint,
	DocumentIdentifier varchar(50),
	Location varchar(200),
	IsVoid char(1),
	StartDate datetime,
	EndDate datetime,
	PRIMARY KEY (UID),
	KEY (FKDocumentUID),
	KEY (FKDocumentSetUID)
) 
;


CREATE TABLE DocumentVersion
(
	UID bigint,
	FKDocumentUID bigint NOT NULL,
	FKDocumentCUID varchar(20) NOT NULL,
	IssueNumber int NOT NULL,
	Location varchar(200),
	FileName varchar(100),
	CreationDateTime datetime,
	UpdateDateTime datetime,
	UserIdCreatedBy varchar(10),
	UserIdUpdatedBy varchar(10),
	IsVoid char(1),
	KEY (FKDocumentUID)
) 
;


CREATE TABLE Employee
(
	FKCompanyUID bigint,
	UID bigint NOT NULL,
	Name varchar(50),
	RoleType varchar(20),
	SequenceNumber int,
	Address varchar(100),
	Phone varchar(20),
	Fax varchar(20),
	EmailAddress varchar(100),
	IsAContact char(1),
	UserIdCreatedBy varchar(10),
	UserIdUpdatedBy varchar(10),
	CreationDateTime datetime,
	UpdateDateTime datetime,
	PRIMARY KEY (UID),
	KEY (FKCompanyUID)
) 
;


CREATE TABLE FCMRole
(
	Role varchar(50) NOT NULL,
	Description varchar(50) NOT NULL,
	PRIMARY KEY (Role)
) 
;


CREATE TABLE FCMUser
(
	UserID varchar(50) NOT NULL,
	Password varchar(50) NOT NULL,
	Salt varchar(50) NOT NULL,
	UserName varchar(50),
	LogonAttempts int,
	PRIMARY KEY (UserID)
) 
;


CREATE TABLE FCMUserRole
(
	UniqueID int NOT NULL,
	FK_UserID varchar(50) NOT NULL,
	FK_Role varchar(50) NOT NULL,
	StartDate date NOT NULL,
	EndDate date,
	IsActive char(1),
	IsVoid char(1),
	PRIMARY KEY (UniqueID),
	KEY (FK_Role),
	KEY (FK_UserID)
) 
;


CREATE TABLE Metadata
(
	UID ,
	FieldCode ,
	CompanyType ,
	CompanyUID ,
	InformationType ,
	TableName ,
	FieldName ,
	FilePath ,
	FileName 
) 
;


CREATE TABLE RegisterofSystemDocuments
(
	DocumentNumber varchar(50) NOT NULL,
	Directory varchar(50),
	SubDirectory varchar(50),
	IssueNumber decimal(10,2),
	DocumentName varchar(50),
	Comments varchar(150),
	PRIMARY KEY (DocumentNumber)
) 
;


CREATE TABLE ReportMetadata
(
	UID bigint NOT NULL,
	RecordType varchar(2) NOT NULL,
	FieldCode varchar(50),
	Description ntext,
	ClientType varchar(10),
	ClientUID bigint,
	InformationType varchar(10) NOT NULL,
	TableNameX varchar(50),
	FieldNameX varchar(50),
	FilePathX varchar(50),
	FileNameX varchar(50),
	Condition ntext,
	CompareWith varchar(100),
	Enabled char(1),
	PRIMARY KEY (UID)
) 
;


CREATE TABLE Security
(
	UserID varchar(50) NOT NULL,
	UserName varchar(50) NOT NULL,
	Password varchar(50) NOT NULL,
	PRIMARY KEY (UserID)
) 
;



SET FOREIGN_KEY_CHECKS=1;


ALTER TABLE Client ADD CONSTRAINT FK_Client_FCMUser 
	FOREIGN KEY (FK_UserID) REFERENCES FCMUser (UserID)
;

ALTER TABLE ClientContract ADD CONSTRAINT FK_ClientContract_Client 
	FOREIGN KEY (FKCompanyUID) REFERENCES Client (UID)
;

ALTER TABLE ClientDocument ADD CONSTRAINT FK_ClientDocument_Client 
	FOREIGN KEY (FKClientUID) REFERENCES Client (UID)
;

ALTER TABLE ClientDocument ADD CONSTRAINT FK_ClientDocument_ClientDocumentSetLink 
	FOREIGN KEY (FKClientDocumentSetUID) REFERENCES ClientDocumentSet (UID)
;

ALTER TABLE ClientDocument ADD CONSTRAINT FK_Document_1_ClientDocument_n 
	FOREIGN KEY (FKDocumentUID) REFERENCES Document (UID)
;

ALTER TABLE ClientDocumentIssue ADD CONSTRAINT FK_ClientDocumentIssue_ClientDocument 
	FOREIGN KEY (FKClientDocumentUID) REFERENCES ClientDocument (UID)
;

ALTER TABLE ClientDocumentLink ADD CONSTRAINT FK_ClientDocumentLink_ClientDocument_Parent 
	FOREIGN KEY (FKParentDocumentUID) REFERENCES ClientDocument (UID)
;

ALTER TABLE ClientDocumentLink ADD CONSTRAINT FK_ClientDocumentLink_ClientDocument_child 
	FOREIGN KEY (FKChildDocumentUID) REFERENCES ClientDocument (UID)
;

ALTER TABLE ClientDocumentSet ADD CONSTRAINT FK_ClientDocumentSetLink_Client 
	FOREIGN KEY (FKClientUID) REFERENCES Client (UID)
;

ALTER TABLE CodeRelated ADD CONSTRAINT FK_Source 
	FOREIGN KEY (FKCodeTypeFrom, FKCodeValueFrom) REFERENCES CodeValue (FKCodeType, ID)
;

ALTER TABLE CodeRelated ADD CONSTRAINT FK_Destination 
	FOREIGN KEY (FKCodeTypeTo, FKCodeValueTo) REFERENCES CodeValue (FKCodeType, ID)
;

ALTER TABLE CodeValue ADD CONSTRAINT FK_CodeValue_CodeType 
	FOREIGN KEY (FKCodeType) REFERENCES CodeType (CodeType)
;

ALTER TABLE DocumentLink ADD CONSTRAINT FK_DocumentLink_Document_from 
	FOREIGN KEY (FKParentDocumentUID) REFERENCES Document (UID)
;

ALTER TABLE DocumentLink ADD CONSTRAINT FK_DocumentLink_Document_to 
	FOREIGN KEY (FKChildDocumentUID) REFERENCES Document (UID)
;

ALTER TABLE DocumentSetDocument ADD CONSTRAINT FK_Document_1_DocumentSetDocument_n 
	FOREIGN KEY (FKDocumentUID) REFERENCES Document (UID)
;

ALTER TABLE DocumentSetDocument ADD CONSTRAINT FK_TemplateDocumentInstance_DocumentTemplateType 
	FOREIGN KEY (FKDocumentSetUID) REFERENCES DocumentSet (UID)
;

ALTER TABLE DocumentSetDocumentLink ADD CONSTRAINT FK_Parent_DSDL_DSD 
	FOREIGN KEY (FKParentDocumentUID) REFERENCES DocumentSetDocument (UID)
;

ALTER TABLE DocumentSetDocumentLink ADD CONSTRAINT FK_Child_DSDL_DSD 
	FOREIGN KEY (FKChildDocumentUID) REFERENCES DocumentSetDocument (UID)
;

ALTER TABLE DocumentSetLink ADD CONSTRAINT FK_DocumentSetLink_Document 
	FOREIGN KEY (FKDocumentUID) REFERENCES Document (UID)
;

ALTER TABLE DocumentSetLink ADD CONSTRAINT FK_TemplateDocumentInstance_DocumentTemplateType 
	FOREIGN KEY (FKDocumentSetUID) REFERENCES DocumentSet (UID)
;

ALTER TABLE DocumentVersion ADD CONSTRAINT FK_DocumentIssue_Document 
	FOREIGN KEY (FKDocumentUID) REFERENCES Document (UID)
;

ALTER TABLE Employee ADD CONSTRAINT FK_Employee_Client 
	FOREIGN KEY (FKCompanyUID) REFERENCES Client (UID)
;

ALTER TABLE FCMUserRole ADD CONSTRAINT FK_FCMUserRole_FCMRole 
	FOREIGN KEY (FK_Role) REFERENCES FCMRole (Role)
;

ALTER TABLE FCMUserRole ADD CONSTRAINT FK_FCMUserRole_FCMUser 
	FOREIGN KEY (FK_UserID) REFERENCES FCMUser (UserID)
;
