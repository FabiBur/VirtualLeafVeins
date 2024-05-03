/*
 *
 *  $Id$
 *
 *  This file is part of the Virtual Leaf.
 *
 *  VirtualLeaf is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  VirtualLeaf is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with the Virtual Leaf.  If not, see <http://www.gnu.org/licenses/>.
 *
 *  Copyright 2010 Roeland Merks.
 *
 */

// WARNING: This file is automatically generated by make_parameter_source.pl. Do not edit.
// Do not edit. All edits will be discarded.

#ifndef PARAMETER_DIALOG_H
#define PARAMETER_DIALOG_H
#include <QDialog>
#include <qspinbox.h>
#include <qlineedit.h>
#include <qlayout.h>
#include <qpushbutton.h>
#include <iostream>

class ParameterDialog : public QDialog {
    Q_OBJECT
	
      public:
	ParameterDialog(QWidget *parent=0, Qt::WindowFlags f = Qt::WindowFlags());
    virtual ~ParameterDialog(void);
    public slots:
    void Reset(void);

    private slots:
    void write(void);

  private:
  QLineEdit *arrowcolor_edit;
  QLineEdit *arrowsize_edit;
  QLineEdit *textcolor_edit;
  QLineEdit *cellnumsize_edit;
  QLineEdit *nodenumsize_edit;
  QLineEdit *node_mag_edit;
  QLineEdit *outlinewidth_edit;
  QLineEdit *cell_outline_color_edit;
  QLineEdit *resize_stride_edit;
  QLineEdit *export_interval_edit;
  QLineEdit *export_fn_prefix_edit;
  QLineEdit *storage_stride_edit;
  QLineEdit *xml_storage_stride_edit;
  QLineEdit *datadir_edit;
  QLineEdit *T_edit;
  QLineEdit *lambda_length_edit;
  QLineEdit *yielding_threshold_edit;
  QLineEdit *lambda_celllength_edit;
  QLineEdit *target_length_edit;
  QLineEdit *cell_expansion_rate_edit;
  QLineEdit *cell_div_expansion_rate_edit;
  QLineEdit *auxin_dependent_growth_edit;
  QLineEdit *ode_accuracy_edit;
  QLineEdit *mc_stepsize_edit;
  QLineEdit *mc_cell_stepsize_edit;
  QLineEdit *energy_threshold_edit;
  QLineEdit *bend_lambda_edit;
  QLineEdit *alignment_lambda_edit;
  QLineEdit *rel_cell_div_threshold_edit;
  QLineEdit *rel_perimeter_stiffness_edit;
  QLineEdit *collapse_node_threshold_edit;
  QLineEdit *morphogen_div_threshold_edit;
  QLineEdit *morphogen_expansion_threshold_edit;
  QLineEdit *copy_wall_edit;
  QLineEdit *potential_slide_angle_edit;
  QLineEdit *source_edit;
  QLineEdit *D_edit;
  QLineEdit *initval_edit;
  QLineEdit *k1_edit;
  QLineEdit *k2_edit;
  QLineEdit *r_edit;
  QLineEdit *kr_edit;
  QLineEdit *km_edit;
  QLineEdit *Pi_tot_edit;
  QLineEdit *transport_edit;
  QLineEdit *ka_edit;
  QLineEdit *pin_prod_edit;
  QLineEdit *pin_prod_in_epidermis_edit;
  QLineEdit *pin_breakdown_edit;
  QLineEdit *pin_breakdown_internal_edit;
  QLineEdit *aux1prod_edit;
  QLineEdit *aux1prodmeso_edit;
  QLineEdit *aux1decay_edit;
  QLineEdit *aux1decaymeso_edit;
  QLineEdit *aux1transport_edit;
  QLineEdit *aux_cons_edit;
  QLineEdit *aux_breakdown_edit;
  QLineEdit *kaux1_edit;
  QLineEdit *kap_edit;
  QLineEdit *leaf_tip_source_edit;
  QLineEdit *sam_efflux_edit;
  QLineEdit *sam_auxin_edit;
  QLineEdit *sam_auxin_breakdown_edit;
  QLineEdit *van3prod_edit;
  QLineEdit *van3autokat_edit;
  QLineEdit *van3sat_edit;
  QLineEdit *k2van3_edit;
  QLineEdit *dt_edit;
  QLineEdit *rd_dt_edit;
  QLineEdit *movie_edit;
  QLineEdit *nit_edit;
  QLineEdit *compatibility_level_edit;
  QLineEdit *maxt_edit;
  QLineEdit *rseed_edit;
  QLineEdit *constituous_expansion_limit_edit;
  QLineEdit *vessel_inh_level_edit;
  QLineEdit *vessel_expansion_rate_edit;
  QLineEdit *d_edit;
  QLineEdit *e_edit;
  QLineEdit *f_edit;
  QLineEdit *c_edit;
  QLineEdit *mu_edit;
  QLineEdit *nu_edit;
  QLineEdit *rho0_edit;
  QLineEdit *rho1_edit;
  QLineEdit *c0_edit;
  QLineEdit *gamma_edit;
  QLineEdit *eps_edit;
  QLineEdit *betaN_edit;
  QLineEdit *gammaN_edit;
  QLineEdit *betaD_edit;
  QLineEdit *gammaD_edit;
  QLineEdit *betaR_edit;
  QLineEdit *gammaR_edit;
  QLineEdit *tau_edit;
  QLineEdit *kt_edit;
  QLineEdit *kc_edit;
  QLineEdit *krs_edit;
  QLineEdit *k_edit;
  QLineEdit *i1_edit;
  QLineEdit *i2_edit;
  QLineEdit *b4_edit;
  QLineEdit *dir1_edit;
  QLineEdit *dir2_edit;
};
#endif
