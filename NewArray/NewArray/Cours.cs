//------------------------------------------------------------------------------
// <auto-generated>
//     此代码已从模板生成。
//
//     手动更改此文件可能导致应用程序出现意外的行为。
//     如果重新生成代码，将覆盖对此文件的手动更改。
// </auto-generated>
//------------------------------------------------------------------------------

namespace NewArray
{
    using System;
    using System.Collections.Generic;
    
    public partial class Cours
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Cours()
        {
            this.UserLearnCoursesRecords = new HashSet<UserLearnCoursesRecord>();
            this.CoursesComments = new HashSet<CoursesComment>();
            this.CoursesNotes = new HashSet<CoursesNote>();
            this.CoursesQuestions = new HashSet<CoursesQuestion>();
            this.Moves = new HashSet<Move>();
            this.UserLearnSectionRecords = new HashSet<UserLearnSectionRecord>();
        }
    
        public int Cou_ID { get; set; }
        public string Cou_Name { get; set; }
        public string Cou_Describe { get; set; }
        public string Cou_Picture { get; set; }
        public decimal Cou_Hot { get; set; }
        public string Cou_Catalog { get; set; }
        public int Cou_Likes { get; set; }
        public int Cou_NotLikes { get; set; }
        public int Cou_StudyNum { get; set; }
        public int Cou_CollectNum { get; set; }
        public int User_ID { get; set; }
        public System.DateTime Cou_Time { get; set; }
        public string Extends1 { get; set; }
        public string Extends2 { get; set; }
        public string Extends3 { get; set; }
        public string Extends4 { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<UserLearnCoursesRecord> UserLearnCoursesRecords { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CoursesComment> CoursesComments { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CoursesNote> CoursesNotes { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CoursesQuestion> CoursesQuestions { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Move> Moves { get; set; }
        public virtual UserInfo UserInfo { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<UserLearnSectionRecord> UserLearnSectionRecords { get; set; }
    }
}
