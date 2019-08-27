/* Insert into Joey's Tables*/
EXEC [dbo].uspINSERT_tblTrip
	@BrokerFname = 'Matthew',
	@BrokerLname = 'Torrance',
	@BrokerCompany = 'Superhalk Industries'
GO

EXEC [dbo].uspINSERT_tblInspector('Matthew','Torrance','Superhalk Industries')
