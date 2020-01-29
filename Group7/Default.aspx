<%@ Page Language="VB" Title="Main" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
	<%-------------------------------------Data Source-------------------------------------------%>
	<asp:AccessDataSource
		ID="ADSNewsCurrent"
		runat="server"
		DataFile="~/App_LocalResources/value.mdb"
		SelectCommand="SELECT [ID], [title], [desc], [linkDesc], [link], [date] FROM [News] WHERE ([date] &gt; ?)">
		<SelectParameters>
			<asp:Parameter
				DefaultValue="01/01/2017"
				Name="date"
				Type="DateTime" />
		</SelectParameters>
	</asp:AccessDataSource>
	<asp:AccessDataSource
		ID="ADSNews2016"
		runat="server"
		DataFile="~/App_LocalResources/value.mdb"
		SelectCommand="SELECT * FROM [News] WHERE (([date] &lt; ?) AND ([date] &gt;= ?))">
		<SelectParameters>
			<asp:Parameter
				DefaultValue="12/31/2016"
				Name="date" Type="DateTime" />
			<asp:Parameter
				DefaultValue="01/01/2014"
				Name="date2" Type="DateTime" />
		</SelectParameters>
	</asp:AccessDataSource>
	<asp:AccessDataSource
		ID="ADSNews2013"
		runat="server"
		DataFile="~/App_LocalResources/value.mdb"
		SelectCommand="SELECT * FROM [News] WHERE (([date] &lt; ?) AND ([date] &gt;= ?))">
		<SelectParameters>
			<asp:Parameter
				DefaultValue="12/31/2013"
				Name="date" Type="DateTime" />
			<asp:Parameter
				DefaultValue="01/01/2011"
				Name="date2"
				Type="DateTime" />
		</SelectParameters>
	</asp:AccessDataSource>
	<asp:AccessDataSource
		ID="ADSContact"
		runat="server"
		DataSourceMode="DataSet"
		DataFile="~/App_LocalResources/value.mdb"
		SelectCommand="SELECT * FROM Contact"></asp:AccessDataSource>
	<asp:AccessDataSource
		ID="ADSBiography"
		runat="server"
		DataFile="~/App_LocalResources/value.mdb"
		SelectCommand="SELECT * FROM [Biography]"></asp:AccessDataSource>
	<%-------------------------------------Data Source-------------------------------------------%>

	<!-- //header -->
	<div class="main">
		<!-- banner -->
		<div class="container">
			<div class="banner">
				<div class="row">
					<div class="col align-self-center">
						<div class="row">
							<div class="col-lg-6">
								<img src="../images/banner1.jpg" alt=" " class="img-fluid">
							</div>
							<div class="col-lg-6">
								<asp:FormView
									ID="FormView4"
									runat="server"
									DataKeyNames="ID"
									DataSourceID="ADSContact"
									CssClass="banner">
									<ItemTemplate>
										<h3>
											<asp:Label
												ID="firstNameLabel"
												runat="server"
												Text='<%# Bind("firstName") %>' />&nbsp;
													<asp:Label
														ID="lastNameLabel"
														runat="server"
														Text='<%# Bind("lastName") %>' />
										</h3>
									</ItemTemplate>
								</asp:FormView>
								<br />
								<asp:FormView
									ID="FormView5"
									runat="server"
									DataKeyNames="ID"
									DataSourceID="ADSBiography"
									CssClass="banner">
									<ItemTemplate>
										<h3>
											<asp:Label
												ID="introductionLabel"
												runat="server"
												Text='<%# Bind("introduction") %>'
												Font-Size="1.1em" />
										</h3>
										<br />
									</ItemTemplate>
								</asp:FormView>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="container gap-ub">
		<div class="alert alert-danger">
			<h1>News 2017 - Current</h1>
		</div>
		<asp:GridView
			ID="GVCurrent"
			runat="server"
			AutoGenerateColumns="False"
			DataKeyNames="ID"
			DataSourceID="ADSNewsCurrent"
			CssClass="table table-striped"
			ShowHeader="false"
			BorderStyle="None"
			GridLines="None">
			<Columns>
				<asp:TemplateField SortExpression="date">
					<ItemTemplate>
						<b>
							<asp:Label
								ID="Label5"
								runat="server"
								Text='<%# Eval("date", "{0:d}") %>'>
							</asp:Label>
						</b>
					</ItemTemplate>
				</asp:TemplateField>
				<asp:TemplateField SortExpression="title">
					<ItemTemplate>
						<b>
							<asp:Label
								ID="Label1"
								runat="server"
								Text='<%# Bind("title") %>'>
							</asp:Label>
						</b>&nbsp;
						<asp:Label
							ID="Label2"
							runat="server"
							Text='<%# Bind("desc") %>'>
						</asp:Label>&nbsp;
						<b>
							<asp:HyperLink
								ID="Label4"
								runat="server"
								Text='<%# Bind("linkDesc") %>'
								NavigateUrl='<%# Bind("link") %>'>
							</asp:HyperLink>
						</b>
					</ItemTemplate>
				</asp:TemplateField>
			</Columns>
		</asp:GridView>
		<div class="alert alert-info">
			<a data-toggle="collapse" href="#div2016" role="button" aria-expanded="false" aria-controls="div2016">
				<h1>Previous News 2014 - 2016</h1>
			</a>
		</div>
		<div class="collapse" id="div2016">
			<asp:GridView
				ID="GV2016"
				runat="server"
				AutoGenerateColumns="False"
				DataKeyNames="ID"
				DataSourceID="ADSNews2016"
				CssClass="table table-striped"
				ShowHeader="false"
				BorderStyle="None"
				GridLines="None">
				<Columns>
					<asp:TemplateField SortExpression="date">
						<ItemTemplate>
							<b>
								<asp:Label
									ID="Label3"
									runat="server"
									Text='<%# Eval("date", "{0:d}") %>'>
								</asp:Label>
							</b>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField SortExpression="title">
						<ItemTemplate>
							<b>
								<asp:Label
									ID="Label6"
									runat="server"
									Text='<%# Bind("title") %>'>
								</asp:Label>
							</b>&nbsp;
							<asp:Label
								ID="Label7"
								runat="server"
								Text='<%# Bind("desc") %>'>
							</asp:Label>&nbsp;
							<b>
								<asp:HyperLink
									ID="HyperLink1"
									runat="server"
									Text='<%# Bind("linkDesc") %>'
									NavigateUrl='<%# Bind("link") %>'>
								</asp:HyperLink>
							</b>
						</ItemTemplate>
					</asp:TemplateField>
				</Columns>
			</asp:GridView>
		</div>
		<div class="alert alert-success">
			<a data-toggle="collapse" href="#div2013" role="button" aria-expanded="false" aria-controls="div2013">
				<h1>Previous News 2011 - 2013</h1>
			</a>
		</div>
		<div class="collapse" id="div2013">
			<asp:GridView
				ID="GV2013"
				runat="server"
				AutoGenerateColumns="False"
				DataKeyNames="ID"
				DataSourceID="ADSNews2013"
				CssClass="table table-striped"
				ShowHeader="false"
				BorderStyle="None"
				GridLines="None">
				<Columns>
					<asp:TemplateField SortExpression="date">
						<ItemTemplate>
							<b>
								<asp:Label
									ID="Label8" runat="server" Text='<%# Eval("date", "{0:d}") %>'>
								</asp:Label>
							</b>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField SortExpression="title">
						<ItemTemplate>
							<b>
								<asp:Label
									ID="Label9"
									runat="server"
									Text='<%# Bind("title") %>'>
								</asp:Label>
							</b>&nbsp;
							<asp:Label
								ID="Label10"
								runat="server"
								Text='<%# Bind("desc") %>'>
							</asp:Label>&nbsp;
							<b>
								<asp:HyperLink
									ID="HyperLink2"
									runat="server"
									Text='<%# Bind("linkDesc") %>'
									NavigateUrl='<%# Bind("link") %>'>
								</asp:HyperLink>
							</b>
						</ItemTemplate>
					</asp:TemplateField>
				</Columns>
			</asp:GridView>
		</div>
	</div>
</asp:Content>

