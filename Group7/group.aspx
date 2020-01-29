<%@ Page Language="VB" Title="Group" MasterPageFile="~/Site.Master" AutoEventWireup="false" CodeFile="group.aspx.vb" Inherits="group" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
<%-------------------------------------Data Source-------------------------------------------%>
	<asp:AccessDataSource
		ID="ADSCurrent"
		runat="server"
		DataFile="~/App_LocalResources/value.mdb"
		SelectCommand="SELECT * FROM [Students] WHERE ([status] = ?)">
		<SelectParameters>
			<asp:Parameter 
				DefaultValue="CURRENT"
				Name="status" 
				Type="String" />
		</SelectParameters>
	</asp:AccessDataSource>
	<asp:AccessDataSource
		ID="ADSPrevious"
		runat="server"
		DataFile="~/App_LocalResources/value.mdb"
		SelectCommand="SELECT * FROM [Students] WHERE ([status] = ?)">
		<SelectParameters>
			<asp:Parameter 
				DefaultValue="PAST" 
				Name="status" 
				Type="String" />
		</SelectParameters>
	</asp:AccessDataSource>
<%-------------------------------------Data Source-------------------------------------------%>
	<div class="container text-center gap-ub">
		<div class="alert alert-danger">
			<h1 class="hovereffect">Current-Students</h1>
		</div>
		<asp:GridView
			ID="GVCurrent"
			runat="server"
			AutoGenerateColumns="False"
			DataKeyNames="ID"
			DataSourceID="ADSCurrent"
			CssClass="table table-striped text-center"
			BorderStyle="None"
			AllowSorting="True"
			GridLines="None">
			<Columns>
				<asp:TemplateField HeaderText="Student Name" SortExpression="studentName">
					<ItemTemplate>
						<asp:Label 
							ID="Label1" 
							runat="server" 
							Text='<%# Bind("studentName") %>'>
						</asp:Label>
					</ItemTemplate>
					<HeaderStyle CssClass="aspText" />
					<ItemStyle Width="50%" />
				</asp:TemplateField>
				<asp:TemplateField HeaderText="Faculty" SortExpression="Faculty">
					<ItemTemplate>
						<asp:Label 
							ID="Label2" 
							runat="server" 
							Text='<%# Bind("facultyID") %>'>
						</asp:Label>
					</ItemTemplate>
					<HeaderStyle CssClass="aspText" />
				</asp:TemplateField>
			</Columns>
		</asp:GridView>
		<div class="alert alert-info">
			<h1 class="hovereffect">Previous-Students</h1>
		</div>
		<asp:GridView
			ID="GVPreivous"
			runat="server"
			AutoGenerateColumns="False"
			DataKeyNames="ID"
			DataSourceID="ADSPrevious"
			CssClass="table table-striped text-center"
			BorderStyle="None"
			AllowSorting="True"
			GridLines="None">
			<Columns>
				<asp:TemplateField HeaderText="Student Name" SortExpression="studentName">
					<ItemTemplate>
						<asp:Label 
							ID="Label1" 
							runat="server" 
							Text='<%# Bind("studentName") %>'>
						</asp:Label>
					</ItemTemplate>
					<HeaderStyle CssClass="aspText" />
					<ItemStyle Width="50%" />
				</asp:TemplateField>
				<asp:TemplateField HeaderText="Faculty" SortExpression="faculty">
					<ItemTemplate>
						<asp:Label 
							ID="Label2" 
							runat="server" 
							Text='<%# Bind("facultyID") %>'>
						</asp:Label>
					</ItemTemplate>
					<HeaderStyle CssClass="aspText" />
				</asp:TemplateField>
			</Columns>
		</asp:GridView>
		<%--		<br />
		<img src="Images/uoit-620.jpg" class="img-responsive img-rounded" />--%>
	</div>
</asp:Content>

