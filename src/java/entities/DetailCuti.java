/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Siti Khusnul Azifah
 */
@Entity
@Table(name = "DETAIL_CUTI")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "DetailCuti.findAll", query = "SELECT d FROM DetailCuti d")
    , @NamedQuery(name = "DetailCuti.findByIdDetailCuti", query = "SELECT d FROM DetailCuti d WHERE d.idDetailCuti = :idDetailCuti")
    , @NamedQuery(name = "DetailCuti.findByNik", query = "SELECT d FROM DetailCuti d WHERE d.nik = :nik")
    , @NamedQuery(name = "DetailCuti.findByKeterangan", query = "SELECT d FROM DetailCuti d WHERE d.keterangan = :keterangan")
    , @NamedQuery(name = "DetailCuti.findByTanggalMulai", query = "SELECT d FROM DetailCuti d WHERE d.tanggalMulai = :tanggalMulai")
    , @NamedQuery(name = "DetailCuti.findByLamaCuti", query = "SELECT d FROM DetailCuti d WHERE d.lamaCuti = :lamaCuti")
    , @NamedQuery(name = "DetailCuti.findByStatus", query = "SELECT d FROM DetailCuti d WHERE d.status = :status")})
public class DetailCuti implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "ID_DETAIL_CUTI")
    private String idDetailCuti;
    @Column(name = "NIK")
    private String nik;
    @Column(name = "KETERANGAN")
    private String keterangan;
    @Column(name = "TANGGAL_MULAI")
    @Temporal(TemporalType.TIMESTAMP)
    private Date tanggalMulai;
    @Column(name = "LAMA_CUTI")
    private Short lamaCuti;
    @Column(name = "STATUS")
    private String status;
    @JoinColumn(name = "ID_CUTI", referencedColumnName = "ID_CUTI")
    @ManyToOne(fetch = FetchType.LAZY)
    private Cuti idCuti;

    public DetailCuti() {
    }

    public DetailCuti(String idDetailCuti) {
        this.idDetailCuti = idDetailCuti;
    }

    public String getIdDetailCuti() {
        return idDetailCuti;
    }

    public void setIdDetailCuti(String idDetailCuti) {
        this.idDetailCuti = idDetailCuti;
    }

    public String getNik() {
        return nik;
    }

    public void setNik(String nik) {
        this.nik = nik;
    }

    public String getKeterangan() {
        return keterangan;
    }

    public void setKeterangan(String keterangan) {
        this.keterangan = keterangan;
    }

    public Date getTanggalMulai() {
        return tanggalMulai;
    }

    public void setTanggalMulai(Date tanggalMulai) {
        this.tanggalMulai = tanggalMulai;
    }

    public Short getLamaCuti() {
        return lamaCuti;
    }

    public void setLamaCuti(Short lamaCuti) {
        this.lamaCuti = lamaCuti;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Cuti getIdCuti() {
        return idCuti;
    }

    public void setIdCuti(Cuti idCuti) {
        this.idCuti = idCuti;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idDetailCuti != null ? idDetailCuti.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof DetailCuti)) {
            return false;
        }
        DetailCuti other = (DetailCuti) object;
        if ((this.idDetailCuti == null && other.idDetailCuti != null) || (this.idDetailCuti != null && !this.idDetailCuti.equals(other.idDetailCuti))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.DetailCuti[ idDetailCuti=" + idDetailCuti + " ]";
    }
    
}
