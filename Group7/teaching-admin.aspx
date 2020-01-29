<%@ Page Language="VB" Title="Teaching-Admin" MasterPageFile="~/Site.Master" AutoEventWireup="false" CodeFile="teaching-admin.aspx.vb" Inherits="teaching_admin" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
	<%-------------------------------------Data Source-------------------------------------------%>
	<asp:AccessDataSource
		ID="ADSTeaching"
		runat="server"
		DataFile="~/App_LocalResources/value.mdb"
		DeleteCommand="DELETE FROM [Courses] WHERE [ID] = ?"
		SelectCommand="SELECT * FROM [Courses]"
		InsertCommand="INSERT INTO [Courses] ([semester], [courseNo], [courseDesc], [institution]) VALUES (?, ?, ?, ?)"
		UpdateCommand="UPDATE [Courses] SET [semester] = ?, [courseNo] = ?, [courseDesc] = ?, [institution] = ? WHERE [ID] = ?">
		<DeleteParameters>
			<asp:Parameter Name="ID" Type="Int32" />
		</DeleteParameters>
		<UpdateParameters>
			<asp:Parameter Name="semester" Type="String" />
			<asp:Parameter Name="courseNo" Type="String" />
			<asp:Parameter Name="courseDesc" Type="String" />
			<asp:Parameter Name="institution" Type="String" />
			<asp:Parameter Name="ID" Type="Int32" />
		</UpdateParameters>
		<InsertParameters>
			<asp:Parameter Name="semester" Type="String" />
			<asp:Parameter Name="courseNo" Type="String" />
			<asp:Parameter Name="courseDesc" Type="String" />
			<asp:Parameter Name="institution" Type="String" />
		</InsertParameters>
	</asp:AccessDataSource>
	<%-------------------------------------Data Source-------------------------------------------%>
	<div class="img-rounded gap-ub">
		<div class="row">
			<div class="col-lg-2"></div>
			<div class="col-lg-8">
				<h1 class="text-center">Teaching-Admin Page</h1>
				<br />
				<asp:FormView
					ID="FVUpdate"
					runat="server"
					DataKeyNames="ID"
					DataSourceID="ADSTeaching"
					CssClass="aspnet100"
					BorderStyle="None">
					<InsertItemTemplate>
						<asp:RequiredFieldValidator
							runat="server"
							ControlToValidate="txtSemester"
							ErrorMessage="* Semester information is required. *"
							ValidationGroup="Add"
							Text="*" 
							CssClass="error">
						</asp:RequiredFieldValidator>
						<b>Semester:</b>
						<asp:TextBox
							ID="txtSemester"
							runat="server"
							Text='<%# Bind("semester") %>'
							CssClass="form-control" />
						<br />
						<asp:RequiredFieldValidator
							runat="server"
							ControlToValidate="txtCourseNo"
							ErrorMessage="* Course No. is required. *"
							ValidationGroup="Add"
							Text="*" 
							CssClass="error">
						</asp:RequiredFieldValidator>
						<b>Course No.:</b>
						<asp:TextBox
							ID="txtCourseNo"
							runat="server"
							Text='<%# Bind("courseNo") %>' 
							CssClass="form-control" />
						<br />
						<asp:RequiredFieldValidator
							runat="server"
							ControlToValidate="txtCourseDesc"
							ErrorMessage="* Course Desc. is required. *"
							ValidationGroup="Add"
							Text="*" 
							CssClass="error">
						</asp:RequiredFieldValidator>
						<b>Course Desc.:</b>
						<asp:TextBox ID="txtCourseDesc"
							runat="server"
							Text='<%# Bind("courseDesc") %>'
							CssClass="form-control" />
						<br />
						<asp:RequiredFieldValidator
							runat="server"
							ControlToValidate="txtInstitution"
							ErrorMessage="* Institution information is required. *"
							ValidationGroup="Add"
							Text="*" 
							CssClass="error">
						</asp:RequiredFieldValidator>
						<b>Institution:</b>
						<asp:TextBox ID="txtInstitution"
							runat="server" 
							Text='<%# Bind("institution") %>'
							CssClass="form-control" />
						<br />
						<asp:ValidationSummary
 
							DisplayMode="BulletList"
							EnableClientScript="true"
							runat="server"
							ValidationGroup="Add"
							ShowSummary="true"
							Font-Bold="true" 
							CssClass="validationSummary" />
						<asp:LinkButton
							ID="InsertButton"
							runat="server"
							CausesValidation="True"
							CommandName="Insert"
							Text="Insert"
							ValidationGroup="Add"
							CssClass="btn btn-primary form-control" />
						<asp:LinkButton
							ID="UpdateCancelButton"
							runat="server"
							CausesValidation="False"
							CommandName="Cancel"
							Text="Cancel"
							ValidationGroup="Add"
							CssClass="btn btn-warning form-control" />
					</InsertItemTemplate>
					<ItemTemplate>
						<asp:LinkButton
							ID="NewButton"
							runat="server"
							CausesValidation="False"
							CommandName="New"
							Text="+ New Record"
							CssClass="btn btn-info"
							Width="100%" />
					</ItemTemplate>
				</asp:FormView>
				<br />
				<asp:GridView ID="GVCourses"
					runat="server"
					AllowSorting="True"
					AutoGenerateColumns="False"
					DataKeyNames="ID"
					DataSourceID="ADSTeaching"
					CssClass="table table-striped text-center"
					BorderStyle="None"
					ShowFooter="False"
					FooterStyle-BackColor="LightGray"
					GridLines="None" 
					AllowPaging="true" 
					PageSize="15">
					<Columns>
						<asp:TemplateField HeaderText="Semester" SortExpression="semester">
							<EditItemTemplate>
								<asp:TextBox
									ID="txtSemester"
									runat="server"
									Text='<%# Bind("semester") %>'
									CssClass="form-control text-center" 
									MaxLength="50">
								</asp:TextBox>
								<asp:RequiredFieldValidator
									runat="server"
									ControlToValidate="txtSemester"
									ErrorMessage="* Semester is required. *"
									ValidationGroup="Edit"
									 CssClass="error">
								</asp:RequiredFieldValidator>
							</EditItemTemplate>
							<ItemTemplate>
								<asp:Label
									ID="Label2"
									runat="server"
									Text='<%# Bind("semester") %>'>
								</asp:Label>
							</ItemTemplate>
							<HeaderStyle CssClass="aspText" />
							<ItemStyle Width="15%" />
						</asp:TemplateField>
						<asp:TemplateField HeaderText="Course No." SortExpression="courseNo">
							<EditItemTemplate>
								<asp:TextBox
									ID="txtCourseNo"
									runat="server"
									Text='<%# Bind("courseNo") %>' 
									CssClass="form-control text-center" 
									MaxLength="50"/>
								<asp:RequiredFieldValidator
									runat="server"
									ControlToValidate="txtCourseNo"
									ErrorMessage="* Course No. is required. *"
									ValidationGroup="Edit"
									 CssClass="error">
								</asp:RequiredFieldValidator>
							</EditItemTemplate>
							<ItemTemplate>
								<asp:Label
									ID="Label3"
									runat="server"
									Text='<%# Bind("courseNo") %>'>
								</asp:Label>
							</ItemTemplate>
							<HeaderStyle CssClass="aspText" />
							<ItemStyle Width="15%" />
						</asp:TemplateField>
						<asp:TemplateField HeaderText="Course Desc." SortExpression="courseDesc">
							<EditItemTemplate>
								<asp:TextBox ID="txtCourseDesc"
									runat="server"
									Text='<%# Bind("courseDesc") %>'
									CssClass="form-control text-center"
									MaxLength="50"/>
								<asp:RequiredFieldValidator
									runat="server"
									ControlToValidate="txtCourseDesc"
									ErrorMessage="* Course Desc. is required. *"
									ValidationGroup="Edit"
									 CssClass="error">
								</asp:RequiredFieldValidator>
							</EditItemTemplate>
							<ItemTemplate>
								<asp:Label
									ID="Label4"
									runat="server"
									Text='<%# Bind("courseDesc") %>'>
								</asp:Label>
							</ItemTemplate>
							<HeaderStyle CssClass="aspText" />
							<ItemStyle Width="30%" />
						</asp:TemplateField>
						<asp:TemplateField HeaderText="Institution" SortExpression="institution">
							<EditItemTemplate>
								<asp:TextBox ID="txtInstitution"
									runat="server" 
									Text='<%# Bind("institution") %>'
									CssClass="form-control text-center" 
									MaxLength="50"/>
								<asp:RequiredFieldValidator
									runat="server"
									ControlToValidate="txtInstitution"
									ErrorMessage="* Institution is required. *"
									ValidationGroup="Edit"
									CssClass="error">
								</asp:RequiredFieldValidator>
							</EditItemTemplate>
							<ItemTemplate>
								<asp:Label
									ID="Label5"
									runat="server"
									Text='<%# Bind("institution") %>'>
								</asp:Label>
							</ItemTemplate>
							<HeaderStyle CssClass="aspText" />
							<ItemStyle Width="10%" />
						</asp:TemplateField>
						<asp:CommandField
							ShowEditButton="True"
							ButtonType="Button" ItemStyle-Width="5%"
							ControlStyle-CssClass="btn btn-default"
							ValidationGroup="Edit" />
						<asp:CommandField
							ShowDeleteButton="True"
							ButtonType="Button" ItemStyle-Width="5%"
							ControlStyle-CssClass="btn btn-danger"
							ValidationGroup="Edit" />
					</Columns>
					<PagerStyle CssClass="pagination-ys" HorizontalAlign="Center"></PagerStyle>
				</asp:GridView>
			</div>
			<div class="col-lg-2"></div>
		</div>
	</div>
</asp:Content>

