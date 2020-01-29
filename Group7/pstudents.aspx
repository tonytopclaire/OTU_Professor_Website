<%@ Page Language="vb" Title="Prospective Students" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeFile="pstudents.aspx.vb" Inherits="pstudents" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
<%-------------------------------------Data Source-------------------------------------------%>
	<asp:AccessDataSource
		ID="ADSResearch"
		runat="server"
		DataFile="~/App_LocalResources/value.mdb"
		SelectCommand="SELECT * FROM [Prospective]"></asp:AccessDataSource>
<%-------------------------------------Data Source-------------------------------------------%>
	<div class="container img-rounded gap-ub">
		<div class="row">
			<div class="alert alert-danger">
				<h1>Prospective Students</h1>
			</div>
			<asp:FormView
				ID="GVPros"
				runat="server"
				DataKeyNames="ID"
				DataSourceID="ADSResearch"
				CssClass="aspnet100">
				<ItemTemplate>
					<asp:Label 
						ID="Field1Label" 
						runat="server" 
						Text='<%# Bind("Field1") %>' />
				</ItemTemplate>
			</asp:FormView>
		</div>
		<br />
		<img src="Images/research_wordle.png" class="img-responsive img-rounded" alt="research"/>
	</div>
	<br />
</asp:Content>
