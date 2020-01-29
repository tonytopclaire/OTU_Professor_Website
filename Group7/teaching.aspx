<%@ Page Language="VB" Title="Teaching" MasterPageFile="~/Site.Master" AutoEventWireup="false" CodeFile="teaching.aspx.vb" Inherits="teaching" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
	<%-------------------------------------Data Source-------------------------------------------%>
	<asp:AccessDataSource
		ID="ADSUOIT"
		runat="server"
		DataFile="~/App_LocalResources/value.mdb"
		SelectCommand="SELECT * FROM [Courses] WHERE ([institution] = ?)">
		<SelectParameters>
			<asp:Parameter
				DefaultValue="UOIT"
				Name="institution"
				Type="String" />
		</SelectParameters>
	</asp:AccessDataSource>
	<asp:AccessDataSource
		ID="ADSCU"
		runat="server"
		DataFile="~/App_LocalResources/value.mdb"
		SelectCommand="SELECT * FROM [Courses] WHERE ([institution] = ?)">
		<SelectParameters>
			<asp:Parameter
				DefaultValue="Carleton University"
				Name="institution"
				Type="String" />
		</SelectParameters>
	</asp:AccessDataSource>
	<%-------------------------------------Data Source-------------------------------------------%>
	<div class="container text-center gap-ub">
		<h1>Teaching List</h1>
		<br />
		<div class="alert alert-danger">
			<h1 class="hovereffect">UOIT</h1>
		</div>
		<asp:GridView
			ID="GVUOIT"
			runat="server"
			AutoGenerateColumns="False"
			DataKeyNames="ID"
			DataSourceID="ADSUOIT"
			CssClass="table table-striped text-center"
			BorderStyle="None"
			AllowSorting="True"
			GridLines="None">
			<Columns>
				<asp:TemplateField HeaderText="Semester" SortExpression="semester">
					<ItemTemplate>
						<asp:Label
							ID="Label1"
							runat="server"
							Text='<%# Bind("semester") %>'>
						</asp:Label>
					</ItemTemplate>
					<HeaderStyle CssClass="aspText" />
					<ItemStyle Width="25%" />
				</asp:TemplateField>
				<asp:TemplateField HeaderText="Course No." SortExpression="courseNo">
					<ItemTemplate>
						<asp:Label
							ID="Label2"
							runat="server"
							Text='<%# Bind("courseNo") %>'>
						</asp:Label>
					</ItemTemplate>
					<HeaderStyle CssClass="aspText" />
					<ItemStyle Width="25%" />
				</asp:TemplateField>
				<asp:TemplateField HeaderText="Course Desc." SortExpression="courseDesc">
					<ItemTemplate>
						<asp:Label
							ID="Label3"
							runat="server"
							Text='<%# Bind("courseDesc") %>'>
						</asp:Label>
					</ItemTemplate>
					<HeaderStyle CssClass="aspText" />
				</asp:TemplateField>
			</Columns>
		</asp:GridView>
		<div class="alert alert-info">
			<h1 class="hovereffect">Carleton University</h1>
		</div>
		<asp:GridView
			ID="GVCU"
			runat="server"
			DataSourceID="ADSCU"
			AutoGenerateColumns="False"
			DataKeyNames="ID"
			CssClass="table table-striped text-center"
			BorderStyle="None"
			AllowSorting="True"
			GridLines="None">
			<Columns>
				<asp:TemplateField HeaderText="Semester" SortExpression="semester">
					<ItemTemplate>
						<asp:Label ID="Label1"
							runat="server"
							Text='<%# Bind("semester") %>'>
						</asp:Label>
					</ItemTemplate>
					<HeaderStyle CssClass="aspText" />
					<ItemStyle Width="25%" />
				</asp:TemplateField>
				<asp:TemplateField HeaderText="Course No." SortExpression="courseNo">
					<ItemTemplate>
						<asp:Label
							ID="Label2"
							runat="server"
							Text='<%# Bind("courseNo") %>'>
						</asp:Label>
					</ItemTemplate>
					<HeaderStyle CssClass="aspText" />
					<ItemStyle Width="25%" />
				</asp:TemplateField>
				<asp:TemplateField HeaderText="Course Desc." SortExpression="courseDesc">
					<ItemTemplate>
						<asp:Label
							ID="Label3"
							runat="server"
							Text='<%# Bind("courseDesc") %>'>
						</asp:Label>
					</ItemTemplate>
					<HeaderStyle CssClass="aspText" />
				</asp:TemplateField>
			</Columns>
		</asp:GridView>
		<%--		<br />
		<img src="Images/uoit_expansion.jpg" class="img-responsive img-rounded" />--%>
	</div>
</asp:Content>

