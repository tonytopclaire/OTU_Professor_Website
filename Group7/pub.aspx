<%@ Page Language="VB" Title="Publications" MasterPageFile="~/Site.Master" AutoEventWireup="false" CodeFile="pub.aspx.vb" Inherits="pub" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
	<%-------------------------------------Data Source-------------------------------------------%>
	<asp:AccessDataSource
		ID="ADSJournal"
		runat="server"
		DataFile="~/App_LocalResources/value.mdb"
		SelectCommand="SELECT * FROM [Publication] WHERE ([type] = ?)">
		<SelectParameters>
			<asp:Parameter
				DefaultValue="JP"
				Name="type"
				Type="String" />
		</SelectParameters>
	</asp:AccessDataSource>
	<asp:AccessDataSource
		ID="ADSConference"
		runat="server"
		DataFile="~/App_LocalResources/value.mdb"
		SelectCommand="SELECT * FROM [Publication] WHERE ([type] = ?)">
		<SelectParameters>
			<asp:Parameter
				DefaultValue="CTP"
				Name="type"
				Type="String" />
		</SelectParameters>
	</asp:AccessDataSource>
	<asp:AccessDataSource
		ID="ADSThesis"
		runat="server"
		DataFile="~/App_LocalResources/value.mdb"
		SelectCommand="SELECT * FROM [Publication] WHERE ([type] = ?)">
		<SelectParameters>
			<asp:Parameter
				DefaultValue="T"
				Name="type"
				Type="String" />
		</SelectParameters>
	</asp:AccessDataSource>
	<asp:AccessDataSource
		ID="ADSSelected"
		runat="server"
		DataFile="~/App_LocalResources/value.mdb"
		SelectCommand="SELECT * FROM [Publication] WHERE ([type] = ?)">
		<SelectParameters>
			<asp:Parameter
				DefaultValue="SP"
				Name="type"
				Type="String" />
		</SelectParameters>
	</asp:AccessDataSource>
	<%-------------------------------------Data Source-------------------------------------------%>
	<div class="tab-div" role="tablist">
		<div class="container img-rounded gap-ub">
			<div class="row">
				<div class="col-md-4 text-center">
					<div class="list-group">
						<a href="#" class="list-group-item active" aria-controls="tab" role="tab" data-toggle="tab">Selected Publications</a>
						<a href="#i01" class="list-group-item" aria-controls="#i01" role="tab" data-toggle="tab">Journal Papers</a>
						<a href="#i02" class="list-group-item" aria-controls="#i02" role="tab" data-toggle="tab">Conference & Technical Papers</a>
						<a href="#i03" class="list-group-item" aria-controls="#i03" role="tab" data-toggle="tab">Thesis</a>
						<a href="#i04" class="list-group-item" aria-controls="#i04" role="tab" data-toggle="tab">Selected Press</a>
					</div>
				</div>
				<div class="col-md-8">
					<div class="container">
						<!-- Tab panes -->
						<div class="tab-content">
							<div role="tabpanel" class="tab-pane active" id="i01">
								<div class="alert alert-danger" id="tbl_Journal">
									<h1>Journal Papers</h1>
								</div>
								<asp:GridView ID="GV01"
									runat="server"
									AutoGenerateColumns="False"
									DataKeyNames="ID"
									DataSourceID="ADSJournal"
									CssClass="table table-striped"
									ShowHeader="false"
									BorderStyle="None"
									GridLines="None">
									<Columns>
										<asp:TemplateField HeaderText="year" SortExpression="year">
											<ItemTemplate>
												<b>
													<asp:Label
														ID="Label1"
														runat="server"
														Text='<%# Bind("year") %>'>
													</asp:Label>
												</b>
											</ItemTemplate>
										</asp:TemplateField>
										<asp:TemplateField HeaderText="title" SortExpression="title">
											<ItemTemplate>
												<asp:Label
													ID="Label2"
													runat="server"
													Text='<%# Bind("title") %>'>
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
							</div>
							<div role="tabpanel" class="tab-pane" id="i02">
								<div class="alert alert-info" id="tbl_Conference">
									<h1>Conference Papers and Technical Reports</h1>
								</div>
								<asp:GridView
									ID="GV02"
									runat="server"
									AutoGenerateColumns="False"
									DataKeyNames="ID"
									DataSourceID="ADSConference"
									CssClass="table table-striped"
									ShowHeader="false"
									BorderStyle="None"
									GridLines="None">
									<Columns>
										<asp:TemplateField HeaderText="year" SortExpression="year">
											<ItemTemplate>
												<b>
													<asp:Label
														ID="Label1"
														runat="server"
														Text='<%# Bind("year") %>'>
													</asp:Label>
												</b>
											</ItemTemplate>
										</asp:TemplateField>
										<asp:TemplateField HeaderText="title" SortExpression="title">
											<ItemTemplate>
												<asp:Label
													ID="Label2"
													runat="server"
													Text='<%# Bind("title") %>'>
												</asp:Label>&nbsp;
												<b>
													<asp:HyperLink
														ID="Label4" runat="server"
														Text='<%# Bind("linkDesc") %>'
														NavigateUrl='<%# Bind("link") %>'>
													</asp:HyperLink>
												</b>
											</ItemTemplate>
										</asp:TemplateField>
									</Columns>
								</asp:GridView>
							</div>
							<div role="tabpanel" class="tab-pane" id="i03">
								<div class="alert alert-info" id="tbl_Thesis">
									<h1>Thesis</h1>
								</div>
								<asp:GridView
									ID="GV03"
									runat="server"
									AutoGenerateColumns="False"
									DataKeyNames="ID"
									DataSourceID="ADSThesis"
									CssClass="table table-striped"
									ShowHeader="false"
									BorderStyle="None"
									GridLines="None">
									<Columns>
										<asp:TemplateField HeaderText="year" SortExpression="year">
											<ItemTemplate>
												<b>
													<asp:Label
														ID="Label1"
														runat="server"
														Text='<%# Bind("year") %>'>
													</asp:Label>
												</b>
											</ItemTemplate>
										</asp:TemplateField>
										<asp:TemplateField HeaderText="title" SortExpression="title">
											<ItemTemplate>
												<asp:Label
													ID="Label2"
													runat="server"
													Text='<%# Bind("title") %>'>
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
							</div>
							<div role="tabpanel" class="tab-pane" id="i04">
								<div class="alert alert-success" id="tbl_Selected">
									<h1>Selected Press</h1>
								</div>
								<asp:GridView
									ID="GV04"
									runat="server"
									AutoGenerateColumns="False"
									DataKeyNames="ID"
									DataSourceID="ADSSelected"
									CssClass="table table-striped"
									ShowHeader="false"
									BorderStyle="None"
									GridLines="None">
									<Columns>
										<asp:TemplateField HeaderText="year" SortExpression="year">
											<ItemTemplate>
												<b>
													<asp:Label
														ID="Label1"
														runat="server"
														Text='<%# Bind("year") %>'>
													</asp:Label>
												</b>
											</ItemTemplate>
										</asp:TemplateField>
										<asp:TemplateField HeaderText="title" SortExpression="title">
											<ItemTemplate>
												<asp:Label
													ID="Label2"
													runat="server"
													Text='<%# Bind("title") %>'>
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
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div style="min-height: 100px;"></div>
	</div>
</asp:Content>

