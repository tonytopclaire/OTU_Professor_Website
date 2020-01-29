<%@ Page Language="vb" Title="Research Interests & Projects" MasterPageFile="~/Site.Master" AutoEventWireup="false" CodeFile="research.aspx.vb" Inherits="research" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
<%-------------------------------------Data Source-------------------------------------------%>
	<asp:AccessDataSource
		ID="ADSResearch"
		runat="server"
		DataFile="~/App_LocalResources/value.mdb"
		SelectCommand="SELECT * FROM [Research]"></asp:AccessDataSource>
<%-------------------------------------Data Source-------------------------------------------%>
	<div class="container img-rounded gap-ub">
		<div class="row">
			<div class="alert alert-danger">
				<h1>Research Interests</h1>
			</div>
			<div class="col-lg-12">
				<br />
				<p>My current research focus is in the area of human factors and computer security. I am working on a number of user-focused research projects in authentication and software security. The collective goal of these projects is to create new solutions and cognitive aids to help people achieve stronger security in various environments. My research aims to understand more about user strategies, preferences, and attitudes in order to inform new designs.</p>
				<br />
				<p>My authentication projects aim to explore novel password strategies and alternatives to passwords that help users achieve stronger memorability and security. Other projects are in the area of software security, exploring methods to help software developers create more secure software. I plan to use the results of these current projects to inform better designs in both user authentication systems and software development environments.</p>
				<br />
				<p>My full list of research interests includes: authentication, software security, human factors, usability, passwords, biometrics, operating system security, security policy, and brain computer interfaces. </p>
			</div>
		</div>
		<br />
		<%--		<img src="Images/research_wordle.png" class="img-responsive img-rounded" />
		<br />--%>
		<div class="row">
			<div class="alert alert-info">
				<h1>Research Projects</h1>
			</div>
			<asp:GridView
				ID="GridView1"
				runat="server"
				AutoGenerateColumns="False"
				DataKeyNames="ID"
				DataSourceID="ADSResearch"
				BorderStyle="None"
				GridLines="None"
				class="aspnet100">
				<Columns>
					<asp:TemplateField SortExpression="ID">
						<ItemTemplate>
							<div class="aspnet100">
								<div class="card">
									<div class="card-body">
										<row>
										<div class="col-lg-2">
											<b>Project #</b>&nbsp;<asp:Label ID="Label3" runat="server" Text='<%# Bind("ID") %>'></asp:Label>
											<b>- </b><br/>
											<asp:Label ID="Label1" runat="server" Text='<%# Bind("name") %>'></asp:Label><br />
										</div>
										<div class="col-lg-10">
											<asp:Image ID="Image1" runat="server" ImageUrl="~/Images/header_UOITlogo.gif"></asp:Image><br/><br/>
											<asp:Label ID="Label2" runat="server" Text='<%# Bind("description") %>'></asp:Label><br />
											<b>Project Link:&nbsp;
											</b><asp:HyperLink ID="Label4" runat="server" Text='<%# Bind("iDesc") %>' NavigateUrl='<%# Bind("iLink") %>'></asp:HyperLink></b>
										<b>External Link:&nbsp;</b><asp:HyperLink ID="Label5" runat="server" Text='<%# Bind("eDesc") %>' NavigateUrl='<%# Bind("eLink") %>'></asp:HyperLink></b>
										<asp:Label ID="Label7" runat="server" Text='<%# Bind("images") %>'></asp:Label>
										</div>
									</div>
								</div>
							</div>
							<br />
						</ItemTemplate>
					</asp:TemplateField>
				</Columns>
			</asp:GridView>
		</div>
	</div>
</asp:Content>
