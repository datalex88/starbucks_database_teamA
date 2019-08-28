/* Insert into Joey's Tables*/
EXEC [dbo].uspINSERT_tblBroker
	@BrokerFname = 'Matthew',
	@BrokerLname = 'Torrance',
	@BrokerCompany = 'Superhalk Industries'
GO
EXEC [dbo].uspINSERT_tblBroker
	@BrokerFname = 'Kate',
	@BrokerLname = 'Superhalk',
	@BrokerCompany = 'Superhalk Industries'
GO
EXEC [dbo].uspINSERT_tblBroker
	@BrokerFname = 'Gary',
	@BrokerLname = 'Sparkle',
	@BrokerCompany = 'Superhalk Industries'
GO
EXEC [dbo].uspINSERT_tblBroker
	@BrokerFname = 'Jim',
	@BrokerLname = 'Superhalk',
	@BrokerCompany = 'Superhalk Industries'
GO
EXEC [dbo].uspINSERT_tblBroker
	@BrokerFname = 'Matthew',
	@BrokerLname = 'Torrance',
	@BrokerCompany = 'Coffee Experts'
GO
EXEC [dbo].uspINSERT_tblBroker
	@BrokerFname = 'Matthew',
	@BrokerLname = 'Torrance',
	@BrokerCompany = 'Coffee Experts'
GO
EXEC [dbo].uspINSERT_tblBroker
	@BrokerFname = 'Matthew',
	@BrokerLname = 'Torrance',
	@BrokerCompany = 'Coffee Experts'
GO
EXEC [dbo].uspINSERT_tblBroker('Kate','Superhalk','Superhalk Industries')
EXEC [dbo].uspINSERT_tblBroker('Gary','Sparkle','Superhalk Industries')
EXEC [dbo].uspINSERT_tblBroker('Jim','Superhalk','Superhalk Industries')
EXEC [dbo].uspINSERT_tblBroker('Dan','Raymond','Coffee Experts')
EXEC [dbo].uspINSERT_tblBroker('Rick','Fish','Coffee Experts')
EXEC [dbo].uspINSERT_tblBroker('Doris','Bishop','Coffee Experts')
EXEC [dbo].uspINSERT_tblBroker('Kate','Jolie','Coffee Experts')
EXEC [dbo].uspINSERT_tblBroker('Carla','Jones','Coffee Deals')
EXEC [dbo].uspINSERT_tblBroker('Daniel','Jones','Coffee Deals')
EXEC [dbo].uspINSERT_tblBroker('Eli','Shurmer','Coffee Deals')
EXEC [dbo].uspINSERT_tblBroker('Pat','Gettleman','Coffee Deals')

EXEC [dbo].uspINSERT_tblInspector('Matthew','Torrance','Superhalk Industries')
EXEC [dbo].uspINSERT_tblInspector('Kate','Superhalk','Superhalk Industries')
EXEC [dbo].uspINSERT_tblInspector('Gary','Sparkle','Superhalk Industries')
EXEC [dbo].uspINSERT_tblInspector('Jim','Superhalk','Superhalk Industries')
EXEC [dbo].uspINSERT_tblInspector('Dan','Raymond','Coffee Experts')
EXEC [dbo].uspINSERT_tblInspector('Rick','Fish','Coffee Experts')
EXEC [dbo].uspINSERT_tblInspector('Doris','Bishop','Coffee Experts')
EXEC [dbo].uspINSERT_tblInspector('Kate','Jolie','Coffee Experts')
EXEC [dbo].uspINSERT_tblInspector('Carla','Jones','Coffee Deals')
EXEC [dbo].uspINSERT_tblInspector('Daniel','Jones','Coffee Deals')
EXEC [dbo].uspINSERT_tblInspector('Eli','Shurmer','Coffee Deals')
EXEC [dbo].uspINSERT_tblInspector('Pat','Gettleman','Coffee Deals')