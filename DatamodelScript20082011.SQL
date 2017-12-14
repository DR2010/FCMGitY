CREATE TABLE Client ( 
	UID bigint NOT NULL,
	Name varchar NOT NULL,
	Address varchar,
	Phone varchar,
	Fax varchar,
	MainContactPersonName varchar,
	EmailAddress varchar,
	CreationDateTime datetime NOT NULL,
	EmailAddress varchar,
	UpdateDateTime datetime NOT NULL,
	UserIdCreatedBy char NOT NULL,
	UserIdUpdatedBy char NOT NULL,
	ABN varchar,
	IsVoid char,
	FKUserID varchar,
	FKDocumentSetUID bigint,
	RecordVersion bigint
)
;

CREATE TABLE ClientContract ( 
	FKCompanyUID bigint,
	UID bigint NOT NULL,
	ExternalID varchar,
	StartDate datetime,
	EndDate datetime,
	UserIdCreatedBy char,
	UserIdUpdatedBy char,
	CreationDateTime datetime,
	UpdateDateTime datetime,
	Status varchar,
	Type varchar
)
;

CREATE TABLE ClientDocument ( 
	UID bigint NOT NULL,
	DocumentCUID varchar,
	FKClientUID bigint,
	FKClientDocumentSetUID bigint,
	FKDocumentUID bigint,
	ComboIssueNumber varchar,
	ClientIssueNumber int,
	SourceIssueNumber int,
	Location varchar,
	EndDate datetime,
	StartDate datetime,
	IsVoid char NOT NULL,
	FileName varchar,
	SequenceNumber int,
	SourceLocation varchar,
	SourceFileName varchar,
	Generated char,
	ParentUID bigint,
	RecordType char,
	IsProjectPlan char,
	DocumentType varchar,
	Status varchar,
	IsRoot char,
	IsFlag char,
	IsFolder char
)
;

CREATE TABLE ClientDocumentIssue ( 
	UID bigint NOT NULL,
	FKClientDocumentUID bigint NOT NULL,
	ClientIssueNumber int NOT NULL,
	Location varchar(200),
	FileName varchar(100),
	IssueNumberText varchar(4),
	SourceIssueNumber int,
	ComboIssueNumber varchar(100) NOT NULL,
	DocumentCUID varchar(20),
	FKClientUID bigint
)
;

CREATE TABLE ClientDocumentLink ( 
	UID bigint NOT NULL,
	FKParentDocumentUID bigint NOT NULL,
	FKChildDocumentUID bigint NOT NULL,
	LinkType varchar NOT NULL,
	IsVoid char NOT NULL,
	FKClientDocumentSetUID bigint NOT NULL,
	FKClientUID bigint NOT NULL
)
;

CREATE TABLE ClientDocumentSet ( 
	UID bigint NOT NULL,
	FKClientUID bigint,
	Description varchar,
	Folder varchar,
	StartDate datetime,
	EndDate datetime,
	IsVoid char,
	ClientSetID bigint,
	SourceFolder varchar,
	Status varchar,
	CreationDateTime datetime,
	UpdateDateTime date,
	UserIdCreatedBy char,
	UserIdUpdatedBy char,
	FolderOnly varchar
)
;

CREATE TABLE ClientDocumentVersion ( 
	UID bigint NOT NULL,
	FKClientDocumentUID bigint NOT NULL,
	ClientIssueNumber int NOT NULL,
	Location varchar,
	FileName varchar,
	IssueNumberText varchar,
	SourceIssueNumber int,
	ComboIssueNumber varchar NOT NULL,
	DocumentCUID varchar,
	FKClientUID bigint
)
;

CREATE TABLE ClientExtraInformation ( 
	UID bigint NOT NULL,
	FKClientUID bigint,
	DateToEnterOnPolicies date,
	ScopeOfServices varchar,
	ActionPlanDate date,
	CertificationTargetDate date,
	TimeTrading varchar,
	RegionsOfOperation varchar,
	FrequencyOfOperations varchar,
	FrequencyOfProjectMeetings varchar,
	RecordVersion bigint
)
;

CREATE TABLE ClientOtherInfo ( 
	UID bigint NOT NULL,
	FKClientUID bigint,
	RCFieldCode varchar,
	FieldValueText varchar
)
;

CREATE TABLE CodeRelated ( 
	FKCodeTypeFrom varchar NOT NULL,
	FKCodeValueFrom varchar NOT NULL,
	FKCodeTypeTo varchar NOT NULL,
	FKCodeValueTo varchar NOT NULL
)
;

CREATE TABLE CodeType ( 
	CodeType varchar NOT NULL,
	Description varchar,
	ShortCodeType char
)
;

CREATE TABLE CodeValue ( 
	FKCodeType varchar NOT NULL,
	ID varchar NOT NULL,
	Description varchar,
	Abbreviation varchar,
	ValueExtended varchar
)
;

CREATE TABLE Document ( 
	UID bigint NOT NULL,
	SimpleFileName varchar,
	CUID varchar NOT NULL,
	Name varchar,
	SequenceNumber bigint NOT NULL,
	IssueNumber int,
	Location varchar,
	Comments varchar,
	FileName varchar,
	SourceCode varchar,
	FKClientUID bigint,
	IsVoid char,
	ParentUID bigint NOT NULL,
	RecordType char,
	FileExtension varchar,
	IsProjectPlan varchar,
	DocumentType varchar,
	Status varchar,
	CreationDateTime datetime,
	UpdateDateTime datetime,
	UserIdCreatedBy varchar,
	UserIdUpdatedBy varchar,
	RecordVersion bigint
)
;

CREATE TABLE DocumentLink ( 
	UID bigint NOT NULL,
	FKParentDocumentUID bigint NOT NULL,
	FKChildDocumentUID bigint NOT NULL,
	LinkType varchar NOT NULL,
	IsVoid char NOT NULL
)
;

CREATE TABLE DocumentSet ( 
	UID bigint NOT NULL,
	TemplateType varchar,
	TemplateFolder varchar,
	IsVoid char
)
;

CREATE TABLE DocumentSetDocument ( 
	UID bigint NOT NULL,
	FKDocumentUID bigint,
	FKDocumentSetUID bigint,
	Location varchar,
	IsVoid char,
	StartDate datetime,
	EndDate datetime,
	FKParentDocumentUID bigint,
	SequenceNumber bigint,
	FKParentDocumentSetUID bigint,
	DocumentType varchar
)
;

CREATE TABLE DocumentSetDocumentLink ( 
	UID bigint NOT NULL,
	FKDocumentSetUID bigint NOT NULL,
	FKParentDocumentUID bigint NOT NULL,
	FKChildDocumentUID bigint NOT NULL,
	LinkType varchar NOT NULL,
	IsVoid char NOT NULL
)
;

CREATE TABLE DocumentSetLink ( 
	UID bigint NOT NULL,
	FKDocumentUID bigint,
	FKDocumentSetUID bigint,
	DocumentIdentifier varchar(50),
	Location varchar(200),
	IsVoid char(1),
	StartDate datetime,
	EndDate datetime
)
;

CREATE TABLE DocumentVersion ( 
	UID bigint,
	FKDocumentUID bigint NOT NULL,
	FKDocumentCUID varchar NOT NULL,
	IssueNumber int NOT NULL,
	Location varchar,
	FileName varchar,
	CreationDateTime datetime,
	UpdateDateTime datetime,
	UserIdCreatedBy varchar,
	UserIdUpdatedBy varchar,
	IsVoid char
)
;

CREATE TABLE Employee ( 
	FKCompanyUID bigint,
	UID bigint NOT NULL,
	Name varchar,
	RoleType varchar,
	SequenceNumber int,
	Address varchar,
	Phone varchar,
	Fax varchar,
	EmailAddress varchar,
	IsAContact char,
	UserIdCreatedBy varchar,
	UserIdUpdatedBy varchar,
	CreationDateTime datetime,
	UpdateDateTime datetime
)
;

CREATE TABLE FCMRole ( 
	Role varchar NOT NULL,
	Description varchar NOT NULL
)
;

CREATE TABLE FCMUser ( 
	UserID varchar NOT NULL,
	Password varchar NOT NULL,
	Salt varchar NOT NULL,
	UserName varchar,
	LogonAttempts int
)
;

CREATE TABLE FCMUserRole ( 
	UniqueID int NOT NULL,
	FK_UserID varchar NOT NULL,
	FK_Role varchar NOT NULL,
	StartDate date NOT NULL,
	EndDate date,
	IsActive char,
	IsVoid char
)
;

CREATE TABLE Metadata ( 
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

CREATE TABLE ProcessRequest ( 
	UID bigint NOT NULL,
	Description varchar NOT NULL,
	FKClientUID bigint,
	Type varchar NOT NULL,
	Status varchar NOT NULL,
	WhenToProcess varchar NOT NULL,
	CreationDateTime datetime NOT NULL,
	PlannedDateTime datetime NOT NULL,
	StatusDateTime datetime NOT NULL,
	RequestedByUser varchar
)
;

CREATE TABLE ProcessRequestArguments ( 
	FKRequestUID bigint NOT NULL,
	Code varchar NOT NULL,
	ValueType varchar,
	Value varchar
)
;

CREATE TABLE ProcessRequestResults ( 
	FKRequestUID bigint NOT NULL,
	SequenceNumber bigint NOT NULL,
	FKClientUID bigint,
	LongText varchar NOT NULL,
	Type varchar
)
;

CREATE TABLE RegisterofSystemDocuments ( 
	DocumentNumber varchar NOT NULL,
	Directory varchar,
	SubDirectory varchar,
	IssueNumber decimal,
	DocumentName varchar,
	Comments varchar
)
;

CREATE TABLE ReportMetadata ( 
	UID bigint NOT NULL,
	RecordType varchar NOT NULL,
	FieldCode varchar,
	Description ntext,
	ClientType varchar,
	ClientUID bigint,
	InformationType varchar NOT NULL,
	TableNameX varchar,
	FieldNameX varchar,
	FilePathX varchar,
	FileNameX varchar,
	Condition ntext,
	CompareWith varchar,
	Enabled char
)
;

CREATE TABLE sysdiagrams ( 
	name sysname NOT NULL,
	principal_id int NOT NULL,
	diagram_id int identity(1,1)  NOT NULL,
	version int,
	definition varbinary(max)
)
;

CREATE TABLE UserSettings ( 
	FKUserID varchar(50) NOT NULL,
	FKScreenCode varchar(50) NOT NULL,
	FKControlCode varchar(50) NOT NULL,
	FKPropertyCode varchar(50) NOT NULL,
	Value nchar(10) NOT NULL
)
;


CREATE INDEX Client_idx
ON Client (IsVoid ASC)
;

CREATE INDEX ClientDocument_idx
ON ClientDocument (FKClientUID ASC, FKClientDocumentSetUID ASC)
;

CREATE INDEX ClientDocument_idx2
ON ClientDocument (FKClientUID ASC, FKDocumentUID ASC, FKClientDocumentSetUID ASC, IsVoid ASC)
;

CREATE INDEX Document_idx2
ON Document (SourceCode ASC, FKClientUID ASC)
;

CREATE INDEX IX_ClientUID_UID
ON Document (FKClientUID ASC, UID ASC)
;

CREATE INDEX IX_SourceCode_ClientID_IsVoid
ON Document (SourceCode ASC, FKClientUID ASC, IsVoid ASC)
;

CREATE INDEX IX_SourceCode_IsVoid
ON Document (SourceCode ASC, IsVoid ASC)
;

CREATE UNIQUE INDEX IX_DocumentSetDocument
ON DocumentSetDocument (FKDocumentSetUID ASC, FKDocumentUID ASC)
;

ALTER TABLE sysdiagrams
	ADD CONSTRAINT UK_principal_name UNIQUE (principal_id, name)
;

ALTER TABLE Client ADD CONSTRAINT PK_Company 
	PRIMARY KEY CLUSTERED (UID)
;

ALTER TABLE ClientContract ADD CONSTRAINT PK_ClientContract 
	PRIMARY KEY CLUSTERED (UID)
;

ALTER TABLE ClientDocument ADD CONSTRAINT PK_ClientDocument 
	PRIMARY KEY NONCLUSTERED (UID)
;

ALTER TABLE ClientDocumentIssue ADD CONSTRAINT PK_ClientDocumentIssue 
	PRIMARY KEY CLUSTERED (UID)
;

ALTER TABLE ClientDocumentLink ADD CONSTRAINT PK__ClientDo__C5B196022610A626 
	PRIMARY KEY CLUSTERED (UID)
;

ALTER TABLE ClientDocumentSet ADD CONSTRAINT PK_ClientDocumentSet 
	PRIMARY KEY CLUSTERED (UID)
;

ALTER TABLE ClientDocumentVersion ADD CONSTRAINT PK_ClientDocumentIssue 
	PRIMARY KEY CLUSTERED (UID)
;

ALTER TABLE ClientExtraInformation ADD CONSTRAINT PK_ClientExtraInformation 
	PRIMARY KEY CLUSTERED (UID)
;

ALTER TABLE ClientOtherInfo ADD CONSTRAINT PK_ClientOtherInfo 
	PRIMARY KEY CLUSTERED (UID)
;

ALTER TABLE CodeRelated ADD CONSTRAINT PK_CodeRelated 
	PRIMARY KEY CLUSTERED (FKCodeTypeFrom, FKCodeValueFrom, FKCodeTypeTo, FKCodeValueTo)
;

ALTER TABLE CodeType ADD CONSTRAINT PK_CodeType 
	PRIMARY KEY CLUSTERED (CodeType)
;

ALTER TABLE CodeValue ADD CONSTRAINT PK_DirectoryType 
	PRIMARY KEY CLUSTERED (FKCodeType, ID)
;

ALTER TABLE Document ADD CONSTRAINT PK_Document 
	PRIMARY KEY CLUSTERED (UID)
;

ALTER TABLE DocumentLink ADD CONSTRAINT PK__Document__C5B1960222401542 
	PRIMARY KEY CLUSTERED (UID)
;

ALTER TABLE DocumentSet ADD CONSTRAINT PK_DocumentTemplateType 
	PRIMARY KEY CLUSTERED (UID)
;

ALTER TABLE DocumentSetDocument ADD CONSTRAINT PK_TemplateDocumentInstance 
	PRIMARY KEY CLUSTERED (UID)
;

ALTER TABLE DocumentSetDocumentLink ADD CONSTRAINT PK__Document__C5B196022DB1C7EE 
	PRIMARY KEY CLUSTERED (UID)
;

ALTER TABLE DocumentSetLink ADD CONSTRAINT PK_TemplateDocumentInstance 
	PRIMARY KEY CLUSTERED (UID)
;

ALTER TABLE Employee ADD CONSTRAINT PK_Employee 
	PRIMARY KEY CLUSTERED (UID)
;

ALTER TABLE FCMRole ADD CONSTRAINT PK_FCMRole 
	PRIMARY KEY CLUSTERED (Role)
;

ALTER TABLE FCMUser ADD CONSTRAINT PK_FCMUser 
	PRIMARY KEY CLUSTERED (UserID)
;

ALTER TABLE FCMUserRole ADD CONSTRAINT PK_FCMUserRole 
	PRIMARY KEY CLUSTERED (UniqueID)
;

ALTER TABLE ProcessRequest ADD CONSTRAINT PK_Request 
	PRIMARY KEY CLUSTERED (UID)
;

ALTER TABLE ProcessRequestArguments ADD CONSTRAINT PK_ProcessRequestArguments 
	PRIMARY KEY CLUSTERED (FKRequestUID, Code)
;

ALTER TABLE ProcessRequestResults ADD CONSTRAINT PK_ProcessRequestResults 
	PRIMARY KEY CLUSTERED (FKRequestUID, SequenceNumber)
;

ALTER TABLE RegisterofSystemDocuments ADD CONSTRAINT PK_RegisterofSystemDocuments 
	PRIMARY KEY CLUSTERED (DocumentNumber)
;

ALTER TABLE ReportMetadata ADD CONSTRAINT PK_WordFieldReference 
	PRIMARY KEY CLUSTERED (UID)
;

ALTER TABLE sysdiagrams ADD CONSTRAINT PK__sysdiagrams__023D5A04 
	PRIMARY KEY CLUSTERED (diagram_id)
;

ALTER TABLE UserSettings ADD CONSTRAINT PK_UserSettings 
	PRIMARY KEY CLUSTERED (FKUserID, FKScreenCode, FKControlCode, FKPropertyCode)
;



ALTER TABLE Client ADD CONSTRAINT FK_Client_FCMUser 
	FOREIGN KEY (FKUserID) REFERENCES FCMUser (UserID)
	ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE ClientContract ADD CONSTRAINT FK_ClientContract_Client 
	FOREIGN KEY (FKCompanyUID) REFERENCES Client (UID)
	ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE ClientDocument ADD CONSTRAINT FK_ClientDocument_Client 
	FOREIGN KEY (FKClientUID) REFERENCES Client (UID)
	ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE ClientDocument ADD CONSTRAINT FK_ClientDocument_ClientDocumentSetLink 
	FOREIGN KEY (FKClientDocumentSetUID) REFERENCES ClientDocumentSet (UID)
	ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE ClientDocument ADD CONSTRAINT FK_Document_1_ClientDocument_n 
	FOREIGN KEY (FKDocumentUID) REFERENCES Document (UID)
	ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE ClientDocumentIssue ADD CONSTRAINT FK_ClientDocumentIssue_ClientDocument 
	FOREIGN KEY (FKClientDocumentUID) REFERENCES ClientDocument (UID)
;

ALTER TABLE ClientDocumentLink ADD CONSTRAINT FK_ClientDocumentLink_ClientDocument_Parent 
	FOREIGN KEY (FKParentDocumentUID) REFERENCES ClientDocument (UID)
	ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE ClientDocumentLink ADD CONSTRAINT FK_ClientDocumentLink_ClientDocument_child 
	FOREIGN KEY (FKChildDocumentUID) REFERENCES ClientDocument (UID)
	ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE ClientDocumentSet ADD CONSTRAINT FK_ClientDocumentSetLink_Client 
	FOREIGN KEY (FKClientUID) REFERENCES Client (UID)
	ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE ClientDocumentVersion ADD CONSTRAINT FK_ClientDocumentIssue_ClientDocument 
	FOREIGN KEY (FKClientDocumentUID) REFERENCES ClientDocument (UID)
	ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE ClientExtraInformation ADD CONSTRAINT FK_ClientExtraInformation_Client 
	FOREIGN KEY (FKClientUID) REFERENCES Client (UID)
	ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE ClientOtherInfo ADD CONSTRAINT FK_ClientOtherInfo_Client 
	FOREIGN KEY (FKClientUID) REFERENCES Client (UID)
	ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE CodeRelated ADD CONSTRAINT FK_Source 
	FOREIGN KEY (FKCodeTypeFrom) REFERENCES CodeValue (FKCodeType, ID)
	ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE CodeRelated ADD CONSTRAINT FK_Destination 
	FOREIGN KEY (FKCodeTypeTo, FKCodeValueTo, FKCodeValueFrom) REFERENCES CodeValue (FKCodeType, ID)
	ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE CodeValue ADD CONSTRAINT FK_CodeValue_CodeType 
	FOREIGN KEY (FKCodeType) REFERENCES CodeType (CodeType)
	ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE DocumentLink ADD CONSTRAINT FK_DocumentLink_Document_from 
	FOREIGN KEY (FKParentDocumentUID) REFERENCES Document (UID)
	ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE DocumentLink ADD CONSTRAINT FK_DocumentLink_Document_to 
	FOREIGN KEY (FKChildDocumentUID) REFERENCES Document (UID)
	ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE DocumentSetDocument ADD CONSTRAINT FK_Document_1_DocumentSetDocument_n 
	FOREIGN KEY (FKDocumentUID) REFERENCES Document (UID)
	ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE DocumentSetDocument ADD CONSTRAINT FK_TemplateDocumentInstance_DocumentTemplateType 
	FOREIGN KEY (FKDocumentSetUID) REFERENCES DocumentSet (UID)
	ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE DocumentSetDocumentLink ADD CONSTRAINT FK_Parent_DSDL_DSD 
	FOREIGN KEY (FKParentDocumentUID) REFERENCES DocumentSetDocument (UID)
	ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE DocumentSetDocumentLink ADD CONSTRAINT FK_Child_DSDL_DSD 
	FOREIGN KEY (FKChildDocumentUID) REFERENCES DocumentSetDocument (UID)
	ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE DocumentSetLink ADD CONSTRAINT FK_DocumentSetLink_Document 
	FOREIGN KEY (FKDocumentUID) REFERENCES Document (UID)
;

ALTER TABLE DocumentSetLink ADD CONSTRAINT FK_TemplateDocumentInstance_DocumentTemplateType 
	FOREIGN KEY (FKDocumentSetUID) REFERENCES DocumentSet (UID)
;

ALTER TABLE DocumentVersion ADD CONSTRAINT FK_DocumentIssue_Document 
	FOREIGN KEY (FKDocumentUID) REFERENCES Document (UID)
	ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE Employee ADD CONSTRAINT FK_Employee_Client 
	FOREIGN KEY (FKCompanyUID) REFERENCES Client (UID)
	ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE FCMUserRole ADD CONSTRAINT FK_FCMUserRole_FCMRole 
	FOREIGN KEY (FK_Role) REFERENCES FCMRole (Role)
	ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE FCMUserRole ADD CONSTRAINT FK_FCMUserRole_FCMUser 
	FOREIGN KEY (FK_UserID) REFERENCES FCMUser (UserID)
	ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE ProcessRequestArguments ADD CONSTRAINT FK_ProcessRequestArguments_ProcessRequest 
	FOREIGN KEY (FKRequestUID) REFERENCES ProcessRequest (UID)
	ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE ProcessRequestResults ADD CONSTRAINT FK_ProcessRequestResults_ProcessRequest 
	FOREIGN KEY (FKRequestUID) REFERENCES ProcessRequest (UID)
	ON DELETE RESTRICT ON UPDATE RESTRICT
;
