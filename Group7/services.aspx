<%@ Page Language="VB" Title="Services" MasterPageFile="~/Site.Master" AutoEventWireup="false" CodeFile="services.aspx.vb" Inherits="services" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
	<%-------------------------------------Data Source-------------------------------------------%>
	<asp:AccessDataSource
		ID="ADSServiceP"
		runat="server"
		DataFile="~/App_LocalResources/value.mdb"
		SelectCommand="SELECT [Service.ID], [Service.desc] as sDesc, [Service.link] as sLink, [Service.linkDesc] as sLinkDesc, [Service.typeID] as typeID FROM [Service] WHERE [service.typeID]='P'"></asp:AccessDataSource>
	<asp:AccessDataSource
		ID="ADSServiceR"
		runat="server"
		DataFile="~/App_LocalResources/value.mdb"
		SelectCommand="SELECT [Service.ID], [Service.desc] as sDesc, [Service.link] as sLink, [Service.linkDesc] as sLinkDesc, [Service.typeID] FROM [Service] WHERE [service.typeID]='R'"></asp:AccessDataSource>
	<%-------------------------------------Data Source-------------------------------------------%>
	<div class="container text-center gap-ub">
		<div class="alert alert-danger">
			<h1 class="hovereffect">Program Committee Member:</h1>
		</div>
		<asp:GridView
			ID="GVSServiceP"
			runat="server"
			AutoGenerateColumns="False"
			DataSourceID="ADSServiceP"
			CssClass="table table-striped text-center"
			BorderStyle="None"
			AllowSorting="True"
			GridLines="None">
			<Columns>
				<asp:TemplateField SortExpression="sDesc" HeaderText="Description">
					<ItemTemplate>
						<asp:Label
							ID="Label1"
							runat="server"
							Text='<%# Eval("sDesc") %>'>
						</asp:Label>
					</ItemTemplate>
					<HeaderStyle CssClass="aspText" />
					<ItemStyle Width="90%" />
				</asp:TemplateField>
				<asp:TemplateField SortExpression="sDesc" HeaderText="Link">
					<ItemTemplate>
						<asp:HyperLink
							ID="Label2"
							runat="server"
							Text='<%# Bind("sLinkDesc") %>'
							NavigateUrl='<%# Bind("sLink") %>'>
						</asp:HyperLink>
					</ItemTemplate>
					<HeaderStyle CssClass="aspText" />
					<ItemStyle Width="10%" />
				</asp:TemplateField>
			</Columns>
		</asp:GridView>
		<div class="alert alert-info">
			<h1 class="hovereffect">Reviewer:</h1>
		</div>
		<asp:GridView
			ID="GVServiceR"
			runat="server"
			AutoGenerateColumns="False"
			DataSourceID="ADSServiceR"
			CssClass="table table-striped text-center aspnet100"
			BorderStyle="None"
			AllowSorting="True"
			GridLines="None">
			<Columns>
				<asp:TemplateField SortExpression="sDesc" HeaderText="Description">
					<ItemTemplate>
						<asp:Label
							ID="Label1"
							runat="server"
							Text='<%# Eval("sDesc") %>'>
						</asp:Label>
					</ItemTemplate>
					<HeaderStyle CssClass="aspText" />
					<ItemStyle Width="90%" />
				</asp:TemplateField>
				<asp:TemplateField SortExpression="sDesc" HeaderText="Link">
					<ItemTemplate>
						<asp:HyperLink
							ID="Label2"
							runat="server"
							Text='<%# Bind("sLinkDesc") %>'
							NavigateUrl='<%# Bind("sLink") %>'>
						</asp:HyperLink>
					</ItemTemplate>
					<HeaderStyle CssClass="aspText" />
					<ItemStyle Width="90%" />
				</asp:TemplateField>
			</Columns>
		</asp:GridView>
	</div>
</asp:Content>
